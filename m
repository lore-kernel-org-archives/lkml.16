Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC41E7C3A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738647637; cv=none; b=IdO2Tzk30Cgwyn87uDiRC/a2M3cj5Ml+KQ2nBY7rWmD9TyGzHj1mFUKHRui9IJ43NWCBQLFf/1KBAcrRnsfMEksJ3XC55+21EGYqwRylFiGsCS6oVhqXB7VLaFz/wT8m9+9qnc7zE1szLSYLe+FVyJEL0GPP7fOvrFYnyA3GE+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738647637; c=relaxed/simple;
	bh=eXMmCbjk+TZAkqST/eM8CQgbJKjPzI/+9lxacBXwtqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPKjbNOsoFHwGKiyKwTH74SGgZn0ElSeHY8p1FncvqAURZSEaNcowMxsKl5ql5RMk//iyz7b+zVnShyOm1OkNJ0x5f7nTziJKN9Yb5pEZ9alTGXGqg+M5IEF2DTNWdPBqSURssMnSsyKgIEsr89GHREVZsPaHmuvebGBUIi5IIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=TwBVoUxg; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="TwBVoUxg"
Received: by lichtman.org (Postfix, from userid 1000)
	id 968121771E3; Tue,  4 Feb 2025 05:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1738647634; bh=eXMmCbjk+TZAkqST/eM8CQgbJKjPzI/+9lxacBXwtqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwBVoUxgehBsa7zF74Si1ZV+9J8aoPV7tZEVD2ZiJtdHTExADhkUzDNGpWJQFZNFg
	 1QBypvclKUEKN7oeQjcEjnx8G2Ro15VoPqu/pvb52bDvjEXysmPlC4IO8rPySjbZL3
	 yLYk6R7VvlVnItoTBjhJ5+Dy3xRItYCyvOHIDY8H/ilVrxdg0pEfr2Aya/JPaOkd7H
	 mFr4skulEUMBN9z/9oqcwo+tK3wUE10NNXO9yiesegW6piY+RV6LOyNK+KzvJpByR+
	 7Xf0e6s9zcAicTeZgftXP6J3lmi4MhsZhP8T452fxY6v875IUVBDEJcqBhErKjUXHv
	 2Vgpw3NC35Mfw==
Date: Tue, 4 Feb 2025 05:40:34 +0000
From: Nir Lichtman <nir@lichtman.org>
To: Doug Anderson <dianders@chromium.org>
Cc: jason.wessel@windriver.com, danielt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kdb: remove usage of static environment buffer
Message-ID: <20250204054034.GA1219827@lichtman.org>
References: <20250203202028.GA1215122@lichtman.org>
 <CAD=FV=WoS+WZ-OX5FnAUuab8re0ovrN9jEm4uADo1XmP5DAGQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WoS+WZ-OX5FnAUuab8re0ovrN9jEm4uADo1XmP5DAGQQ@mail.gmail.com>

On Mon, Feb 03, 2025 at 01:13:31PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Mon, Feb 3, 2025 at 12:20 PM Nir Lichtman <nir@lichtman.org> wrote:
> >
> > @@ -348,9 +315,12 @@ static int kdb_setenv(const char *var, const char *val)
> >
[..]
> > +               kdb_printf("Could not allocate space for the env var: %s\n",
> > +                               var);
> 
> You don't need the printout. kmalloc is already very shouty if memory
> allocations fail.
> 
> 
> > +               return KDB_KMALLOCFAILED;
[..]
> > +                       kfree(__env[i]);
> 
> I haven't tested it, but shouldn't the above be kfree_const() instead
> of kfree()? Otherwise won't you be trying to kfree() the initial
> strings? ...or am I missing something?

Hi Doug,

Thanks for the review, you're right, my bad, I'll fix to use kfree_const.

Sending shortly a v2 with the fixes.

Nir

> 
> 
> -Doug

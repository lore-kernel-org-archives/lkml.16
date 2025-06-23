Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12EC1DDA31
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705573; cv=none; b=X33HUaNExP97UNsOUXJ+t0ew5GVuRMmzoAnmWM2JlZPHDQf49v0aMNXYY69OQHN048Maf7HVxxgcFBE1eOmNvEGctZxkzpCpBxhgmt8ezts90XxOGSozXct93lPJE9DH3LcZiUmWuBqBpPznxbqdyxWJ+IEwvpSNWDWWfsoGnqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705573; c=relaxed/simple;
	bh=3bOfK9tvYoyS32c76foHmKh4Nx/kpDESMgccvA7X4rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPg5R6DfvNMt/M+4LwE4+2woyp1qEUaEHZr8gCTcOaY3jXXVEehJXcgqUCM9w9UdR9QpHVWxb2XwjP8ltfkbGOK89dSW/A+RAHmBF7H9k1vabyvLZa/YvVP7IbLOnIBnFn/cbaxvjOmUiX5y7PbuScbGZGWlom1v5PIdXv6HAHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=AfAAY9FH; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="AfAAY9FH"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fae04a3795so51029336d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750705570; x=1751310370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lxtXCdFFskodxZfUDn7ahA5cQvmoiafw7SnR22JSkSM=;
        b=AfAAY9FHurDivq5Cad65CDqFtiRwquhbrHAzRrBfgj3bNl/U6HFQQnq0NYgsaKG2kO
         PgmNKBmIEbY7zfu0y5/eodDKKjnoDRVyZgARvJLu3TeKgR6sAyqw9uy6B7k6Xzq72Pli
         L15RWu2QxrIH8DBffmPYJ8/bjIIO5YXdFQjFnUAdFooPfSaMs4MIx6K0TkL9tLX4mwmw
         OKVThrglRo9MiM2Ss0IDZGzX4pjNPqSoccUUQTHW+PX571W0cxzf0trrEPUhe94Qv0f2
         AWcVbXojOJ/vq/S7uLNWrsMXQVI1+p8hr43SnppZSTpifk1ttrIwZTnN7L4Sw3aVLI12
         cMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750705570; x=1751310370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxtXCdFFskodxZfUDn7ahA5cQvmoiafw7SnR22JSkSM=;
        b=h70/i1HRgNjl8ZwAgL5XdNi/AvBmlRPG2QiA4rcls6nb2rEZ2PjFdwmQmEzcxTLdeT
         hUKen/JDrn58nAAoacsrU0C1utwdMPXVy8j0MMIOWgyNl0EYs3tajQldOMoO7apApS2V
         shtpFXDkop8YkpaysjL3U3AWzq3YO2vuOiH9SQvO/UHCakyuYS8zwYEOyD4JtyM7nuYa
         PkhFUodjwO7X6rfnIHmLiGGQge5aDKb4NdOfdke9Qq45zgbwjWragjQA297WpabKC6Ua
         Qd+Lg2+sme60+7JiXuFtxZDH3hs3iycCg2Saq2qlt0pb5dOdeNbfopHfuGY/gT3baAdP
         dHoA==
X-Forwarded-Encrypted: i=1; AJvYcCVM2TqWwK1M6iTeAZluE90f2fUWa0aWmsxBlitXELiAuy2SUpOYHudmyryqTh8PRyJRzjYD3NkYMJ/n7j8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yweq+N7tJys6lyFOGfsjxsbzY4HIeLoi2sT1xdJ76chBKFaBctw
	jcVnqcxI0PGxJAyuVIE+5cl2JhZiOxahzG0jlBIEdzeWw57aCF895LGj18TghVAZH7sWZvh12mo
	1WjUd
X-Gm-Gg: ASbGncs4vebiwkZomaFcXPyl2hSYi/+807k+mILLvQ64ftRBuSp6RTLSYGXt253GYrl
	3lcxCgbdQM215fJ7xjPXsWGSoApp4eUW3rYjoZ7tXUueQpuZlgjhl1XObQQ16pc+tl4wVA1dEol
	gyC6hFqXAXCsigN0aRNTLab2X9VMEkznMZASvY/HjgL77nZRuyW/CMZW9Jipk+mBhSqzp5ddu+J
	QWeQ/izSiH8lq6i7uhqWhfTqTQsqQ4M7knGDQ19dSBSuSK8PoyhH176O84aPaKnVBKmi6FopscG
	dt1OiCIRNIFrJoIUS8lqLSFZO1eXznJPRXuEMEy3FOFJTg9xEdvXYjlEISzHavIBGWwK
X-Google-Smtp-Source: AGHT+IHKfvbJCKgRw95/hYlzipmhgWo0bFzDAVi72dVhWbrFTXEA6+zicJGy7m3eDM/cdLV9FpbUog==
X-Received: by 2002:a05:6214:540c:b0:6fb:4e46:7f3a with SMTP id 6a1803df08f44-6fd0a4d68f5mr258869806d6.16.1750705569727;
        Mon, 23 Jun 2025 12:06:09 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:e19e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd24877949sm22887026d6.88.2025.06.23.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:06:09 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:06:07 -0500
From: Gregory Price <gourry@gourry.net>
To: Bijan Tabatabai <bijan311@gmail.com>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	sj@kernel.org, akpm@linux-foundation.org, david@redhat.com,
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, bijantabatab@micron.com,
	venkataravis@micron.com, emirakhur@micron.com, ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: Re: [RFC PATCH v2 1/2] mm/mempolicy: Expose get_il_weight() to MM
Message-ID: <aFmln7KNVhE9-NIy@gourry-fedora-PF4VCD3F>
References: <20250620180458.5041-1-bijan311@gmail.com>
 <20250620180458.5041-2-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620180458.5041-2-bijan311@gmail.com>

On Fri, Jun 20, 2025 at 01:04:57PM -0500, Bijan Tabatabai wrote:
> From: Bijan Tabatabai <bijantabatab@micron.com>
> 
> This patch exposes get_il_weight() in mm/internal.h. This patch is to
> allow other parts of the MM subsystem, such as DAMON, to make page
> placement decisions based on the global interleave weights.
> 
> Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

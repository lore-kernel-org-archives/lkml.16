Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A472750FA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702553; cv=none; b=rWG63G7VrS0XpOYKCFcBvwkPPfAnr0+WeUjVAv6yKrEKx3AxklY45FMfW7jXuBtOZYtAzQMAR6lg0vphJ7TyMVTQL+LML852IQLgSET+qqIw6nEfr6VK9/ionZnKiwCYo8QvFI79PaxVSJ9KVj7it3gY8lJWLeYKmp1NYrsHVN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702553; c=relaxed/simple;
	bh=dgumXb6j7La/BC/Odb2opmjGR1aZZC7uEw5ri8A/dyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHonCTmwyvB5rSwPvv48QT4EuvnopsJkD2BZlMqh8HeBjpi3elKLB9IOF1keGMgHa+wE6BZgbs+mHEexm7Iix37kUtSwbX8/kk67NAppbxSZkO8GWFgTKiIrldbX31QDO/+ngZjJ9JQdK6AcAXDnGDFwgjnmwWjhKzFkuOx0rWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWU8Ygmj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWU8Ygmj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F24C4CEDD;
	Tue, 15 Apr 2025 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744702553;
	bh=dgumXb6j7La/BC/Odb2opmjGR1aZZC7uEw5ri8A/dyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWU8YgmjJsUnl4ZNI6frWhPFGzm7qdWuUhd7xlyjBOGsbHnEVm3HEoSkVMkWwdK2y
	 wJQWaV9jSKMwIziHwPZinYcEEcOW6ROM7cGcUZ/nu6Ym9MItoTc1QO/jnEQ2QJjcQF
	 VwmNjiL5lE00vhQ9ymHn44aSHJRonNK0FuehBiEU6xrZQ8eEOiWMRX2cbtRdGlpkgP
	 55aGOOgZmWgWpP3kVBG8rsKPAY4f565L7lHzxq1eUYgQMLy9S/xuwtcv1hCry2DrVa
	 w7Usc6HNzq2Pnxobl8kPugaBTk3iPcQXhPhI1RFLvmhTFpKAxhgEXjMusqy5cWY7Yj
	 wB8rbtuNZLb6A==
Date: Tue, 15 Apr 2025 09:35:49 +0200
From: Christian Brauner <brauner@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] release_task: kill the no longer needed
 get/put_pid(thread_pid)
Message-ID: <20250415-haare-kroch-2c11f03bd81d@brauner>
References: <20250411121857.GA10550@redhat.com>
 <20250414-lappalie-abhilfe-eb7810af39bb@brauner>
 <20250414-tintenfleck-planbar-656144f25a3b@brauner>
 <CAGudoHGyN5qno0TVfY-vCJBHjkDd-CL82-W_o7u6b+qXraAJVA@mail.gmail.com>
 <20250414204535.GI28345@redhat.com>
 <CAGudoHGi6yZNDVzA1coEu5t4NB_PB51wo1tJmKV0f=mxzWs=0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHGi6yZNDVzA1coEu5t4NB_PB51wo1tJmKV0f=mxzWs=0w@mail.gmail.com>

On Mon, Apr 14, 2025 at 11:26:35PM +0200, Mateusz Guzik wrote:
> On Mon, Apr 14, 2025 at 10:46 PM Oleg Nesterov <oleg@redhat.com> wrote:
> > I'd prefer to move add_device_randomness() after release_thread(),
> > but perhaps this needs another minor cleanup?
> >
> 
> I have no opinion on that front. As far as cosmetics go I would not
> touch it past the nit I mentioned in my previous e-mail, but I'm not
> going to protest any other changes.
> 
> imo the real thing to do concerning the routine is to figure out if
> the call is even of any benefit -- it very well may be this is call is
> only there because nobody with random-fu bothered to remove it.
> Personally I have epsilon knowledge of that area, so I'm not even
> going to try to evaluate it. But it would be nice if someone(tm)
> reached out to random folk concerning it. Worst case, even if it still
> has to be there, maybe the sucker can trylock and bail. It does
> contribute to contention, likely for no good reason.

Afaict, add_device_randomness() cannot block. So why can't we just move
this into put_task_struct_rcu_user() (or some variant that's local to
kernel/exit.c)? I see no reason why this would need to be done
synchronously?

Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B97285066
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240906; cv=none; b=Uunpewh87AGovnSAvTK+4pylNA+gN9Ta61nIMCZHjAUx4BcxPA4lTR8FOdtreQu6PgYx0pmffHyqPy3lyV/UJP0BDa2h6Cs+3W5t2yc8SZcxvQOZYB/fYQ0s8Hg44gI87blIHEskD/OtDrG6j+F5hjY2FiG++VYCdHzOPn+XdIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240906; c=relaxed/simple;
	bh=WCVF2Ik6cQiyZrN1eJ2hI7RX/6WB/o9Hq3Z0S/EjNpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwjzByd7G315FTVJZI3TNYS7Y6aPk+YvrrvywCKPV9rHcg55LPJG3dlui9kQbYOQJhBltEO+6KUFRjGOrhZy7qHOHBCc+YCpf8i7aWAKVEW8V41kET9ZnTBFqDDgGHARuLO+yIA4x92FQHaB9ih+6ygwo9zqXuAzY6F78ciAPB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=q9DBmO5R; arc=none smtp.client-ip=185.125.25.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="q9DBmO5R"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMfQp2GrJzBS3;
	Wed, 18 Jun 2025 12:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1750240898;
	bh=nEHEmzkiwXFLv1SbStj09UkDIZNvmgynLKahQDMXZD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9DBmO5RWzllCwu7QyGb1MOtgsgdYaS4jYucZFI6GTA0YQZw2BJlEMPctfsJsAcis
	 FjScahc+tG58mpgXAHUKeksKJUTsqD/WOBR1rc0Y2K9UY8O9A9MS86g5QxPtiS0Qhi
	 tjoYtTaw/gxsRqTpyfa1/jbuqDqhCGkEJnKYXJSQ=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMfQn5gtrzHCJ;
	Wed, 18 Jun 2025 12:01:36 +0200 (CEST)
Date: Wed, 18 Jun 2025 12:01:36 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the landlock tree
Message-ID: <20250618.ohsahpoo4It4@digikod.net>
References: <20250618075128.2a8e9fcd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618075128.2a8e9fcd@canb.auug.org.au>
X-Infomaniak-Routing: alpha

On Wed, Jun 18, 2025 at 07:51:28AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   4213018f5f77 ("selftests/landlock: Fix readlink check")
> 
> is missing a Signed-off-by from its author and committer.

Thanks, fixed.

> 
> -- 
> Cheers,
> Stephen Rothwell



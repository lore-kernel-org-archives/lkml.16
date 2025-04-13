Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636601E5B8B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744571057; cv=none; b=s7qNyxiqDHi3rqHlU/CPXSLvRwfUbhtcy4x3rlZB6dj5rY9HRZspMZjOZblFqPQSJpQUXjcBfuqv3geS3BOCLMJnKlEmepFggTaObHLIbJ2LfDI/nFHKRWvfOj0hKG3LgmBoZJoLi5SxCMtewF5/Ml+d6kVtuXyBK5c1arRLs4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744571057; c=relaxed/simple;
	bh=4ITOtm12KNZy0mOjk6oT1xqCQhOj48yZg/Yg4eu8b/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEGIHM11xlVKy9WsoiYr8VdWWiI1jKTzpfFv2mQsIbWeF8SPH+iOkT4lY8EqazHJ4yHZvrBX2ghKs4Gh1fHizIMl8ndM2hNjd1IkGoiXSwdGOXbH8dYwWFnPFWmtGhFdM12a8iRaF2txLkTT0Zm9nyTO9boFNHhWzIQ8yuL8Q64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkV5p5yO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkV5p5yO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3578C4CEDD;
	Sun, 13 Apr 2025 19:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744571053;
	bh=4ITOtm12KNZy0mOjk6oT1xqCQhOj48yZg/Yg4eu8b/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkV5p5yOsVOUxdZMa8JfjAjJuNlWC5wFrphcvbc6lz23Sl46BnORd8AX32q1re9D/
	 w1boH5jDEGPsKNxlr8AhOPG7Manqy+uVkbGWR9SUou1X+B3iFTIFRpfSdfWLaP0PwT
	 S1UlHxfN6sKGaefxLXMij/XJAa6GygvxmNB6K/4QkNn/JN7nIzvciRIH+AXmm8hkpR
	 QR1ZcYyajl3DwOvwHzgH/rdTNA6X80A5fssqDH5bZPAOBHzIkej4W1Q5J6B6ibMRVF
	 aH1I1YAgmAfvbEaSb3Pfi3cnataF9gfj2tKlXBRwFXB7LqZpukXa4S7eeYrPVMqi0a
	 HTIbBwEH9uFkw==
Date: Sun, 13 Apr 2025 21:04:09 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, hpa@zytor.com
Subject: Re: [PATCH] x86/Kconfig: Fix dependency for X86_DEBUG_FPU
Message-ID: <Z_wKqbQRsnOCPYrM@gmail.com>
References: <20250407231057.328010-1-skhan@linuxfoundation.org>
 <Z_TIMh7UsWQiSkqg@gmail.com>
 <f9642a9f-27d4-4f84-818c-390194b898bf@linuxfoundation.org>
 <Z_bnzs3IPyhVIYaT@gmail.com>
 <e0842dd0-71d3-4de0-a2ee-e83493df890b@linuxfoundation.org>
 <Z_dl0HhwMOBkVTFH@gmail.com>
 <a874a35f-b63a-4e7b-8d5a-3696b7f39b74@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a874a35f-b63a-4e7b-8d5a-3696b7f39b74@linuxfoundation.org>


* Shuah Khan <skhan@linuxfoundation.org> wrote:

> The only thing I can think of is somehow make didn't run oldconfig or 
> if it did didn't pick up the right the first time around ... Not 
> sure.
> 
> You can ignore this patch. Sorry for the noise.

No problem! :-)

	Ingo

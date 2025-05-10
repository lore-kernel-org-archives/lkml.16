Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D90014901B;
	Sat, 10 May 2025 18:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746903374; cv=none; b=dWF6x3kGBynniNrvPsqiZ4Q8WQFd7EbYd7BS2TfkY9ptyoKYIQ27M1DXj+yoQGgJ6stWFzOFrUaT8Wyl2PCtTRJI3omidE5kYc111zUwDeiX9AIOLMvHQh5y3/2BxHjXfvL8Cth3QVzJOodCvrS5aI6u2AILWNFV+duZlOcJaBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746903374; c=relaxed/simple;
	bh=sYK72jBvgVSxhElTy/MD1VFf65hh+HF+faCDPTny7VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQxHsVtRZVfNjZx3vgf8L89Xpj2EbkIRQEiTT1E+mtrn+1IK4DiS6Fd+EHy7V7wUtddPXPJ6KpvjrnJ2AjtLHJDyFL8JmuETUJLNKpUgyhyXR+aYn8gDeCuzhpGB3v2xiWg01+pOuk+mJyVE9dIMeZqRNxYPUPno+CjuA6kpufc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7uqFIL4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7uqFIL4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso21291315e9.3;
        Sat, 10 May 2025 11:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746903370; x=1747508170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sV6+C/SkMy5hqY/2ZrPRB8T+4Wfbn/XWQI3x/65ffmA=;
        b=X7uqFIL43UZxYgClnq+8XcLxNnAgNw+We6I7l3WkIn05i7sV7JndchyUeQHeIP+1qS
         T4sg/FKsiBy9oK0cYuQ3VROZYm/FHQiE1eTQileKML/FRCzJBANx+ukPZhGvIZEYFwr8
         6chSKoKf95Wy+U54qyzVyNvfC41cpvJkr9/W0IgmzPcSJ9kSZCQYviV2W8FcMedKJ9au
         nquIPjLJ2qVgfMFOwXdqa7QnzxloqZ4CryrAiCl+IfJLm3m/A3yXewl+v2Z8e5JZApqE
         uE/yiATQOe4956FzzhSkoUrqTiMyopyS9H/mRMXja7HTIKFpQigMhb1pxWX2fXxw70md
         OTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746903370; x=1747508170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sV6+C/SkMy5hqY/2ZrPRB8T+4Wfbn/XWQI3x/65ffmA=;
        b=jrRZSAanyzRkcjJac/fNbq6GRF69dvHp9Zy9a0vdRNiS8lIkZ64T+J2UzvQDZ2lda/
         RmYrxP/0smE2gWJRZYt0dLPxaihhonWdzXPen67ZuKbo1hw5mDzW0KQE1Df566nBABry
         a0TeBn8CcOPI3N6N8UdA1t7xG5eY7GTvDp52utbqpKGd02KTJkJK38RVFVSGigEyCYtK
         E1BHgiaYhYiOrzhDq2ucT2w4WGC7vRoNNy6d6osfRdL0QA/0sCnAs34/hlnVxucH4R/S
         DP/oeX6VDziRgiJEN4hiwu8UU/t6j+r9JdtAgxTXoNMI17ihq40VELgH2j/9o0EyTJTx
         0oRg==
X-Forwarded-Encrypted: i=1; AJvYcCVvlMT9OId4go/T1gusXtha+7T73WKDQhQ5BzVEZVc0hZYqgZ5WLFgJ3155P1ScJox/vtJPrYVRSY86jY8=@vger.kernel.org, AJvYcCWPY++MB2BDCNIJYCB7oUx9n6acVMpDtpZEGw7duDSyVbgXvcwFpmHjQP0lsH1evG8BjeNGs7sjaENP@vger.kernel.org
X-Gm-Message-State: AOJu0YzFdo2sfBKCIfxUhOC+W6axiLmrppvJpdiC8lur+2MwoHAwGMOI
	nMMK8FEGVjRlFApeXy5ICy5W5UAv0BvP5fHLhXLJQ/2ey9AW9bFn
X-Gm-Gg: ASbGncsNhlCLwDUR32djSk+hkaF22ZaFX4DWoOKSJGvN8KNS21e1lspav7gIgF5o2N/
	6D95WpHi8V0JJZ99tAeuSrAtRsL/Of9nCRzkc28H+aIaZkJGyLxJS6blxWSjVrNhyVi5g0joQ/M
	TEQTe8GJZRa//39EjvaDh0tJ8YrUSfcnLIBAKjDJIQ7ztKARkOD4eFIo/6+iVg/DxOOqS0EPMWK
	rrv5Y79BVBkHHwb/bPtq88OUSyrH+G/Ckk04pMq9ukVDfJ6zbOTTJwlcqCQLr6cxRLOXP5yYq3k
	m38oPnf5Ym0x5zzydvll2U7w3qdxRG+qFq4xOGGeBgjV4qKMPVndhDpQgE2TaBmUDEbVBWwB+sN
	D7VSFoYIts081kg==
X-Google-Smtp-Source: AGHT+IHRvI9gry6ZmfPemiXxUUiYsvTTV5FOvmHsNPAkWQhK57k+tBWZiGsFiSuKBxKvkv1MiJs9RQ==
X-Received: by 2002:a05:6000:4282:b0:3a2:453:7792 with SMTP id ffacd0b85a97d-3a2045378afmr220269f8f.43.1746903370425;
        Sat, 10 May 2025 11:56:10 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d30asm7100862f8f.76.2025.05.10.11.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 11:56:10 -0700 (PDT)
Date: Sat, 10 May 2025 19:56:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] CodingStyle: tell people how to split long "for"
 loops
Message-ID: <20250510195603.37279af3@pumpkin>
In-Reply-To: <20250509203430.3448-8-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
	<20250509203430.3448-8-adobriyan@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 May 2025 23:34:29 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  Documentation/process/coding-style.rst | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index e17de69845ff..494ab3201112 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -183,7 +183,21 @@ Descendants are always substantially shorter than the parent and
>  are placed substantially to the right.  A very commonly used style
>  is to align descendants to a function open parenthesis.
>  
> -These same rules are applied to function headers with a long argument list.
> +These same rules are applied to function prototypes with a long argument list.
> +
> +Very long ``for`` loops are split at the ``;`` characters making it easier
> +to see which code goes to which clause:
> +
> +.. code-block:: c
> +
> +	for (int i = 0;
> +	     i < N;
> +	     i += 1)
> +	{
> +	}
> +
> +Opening curly is placed on a separate line then to make it easier to tell
> +loop body from iteration clause.

Is that actually the style - I don't remember seeing it.

The location of the { isn't a significant problem with for (;;), it can be
much worse elsewhere.
In reality the 'align with the (' is what causes the problems, either
double indenting (two tabs) or half indent (4 spaces - to annoy anyone who
sets an editor to 4 space tabs) is more readable.

For for (;;) loops I'll normally try moving the initialisation outside the
loop and even put an inverted condition inside the loop to avoid long lines.

If a #define all bets are off :-)

	David



>  
>  However, never break user-visible strings such as printk messages because
>  that breaks the ability to grep for them.


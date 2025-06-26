Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5B22F362D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949361; cv=none; b=M/JCg7231zdn/pIXr5GPbgv7ZUB1F4rRc4J11sSLotgQayRohHpMdiWqI+sWFBa/6r51k/NUyIr6sKifPKg0oa/D0kTFq7JhC/EqhL0Z9+OTDPQq7Jc14iJ5AOuiEngWHUpMYDa+w6dg547npAx8Xx8zQ8gqWDyT01n6RJnq+cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949361; c=relaxed/simple;
	bh=e+p1u3bjk72DZ4xXV4yRymVTRZjUSFmGtt4UT1KJy4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8u+qVqq/8HBjFAuTIHOtl8z5k3a6eKYjvW554bcpi28LwzRcNwYF7KZtLoIoNjAIwNeoe2Q7z8dp7w9UpXjksgNCM6BkMwYwRuTgImi16FfsAKBfMZL31/d86HzYqCT6Mnci/MMteDA4OBkizsNKPixAS9h31r8Qxc2lK89Bi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=OoE0pHQk; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="OoE0pHQk"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40b31468da3so38619b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750949357; x=1751554157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDTHGKJ7PRnQtifJssL8JUIIPtKYbrBYEt3PvsupNKg=;
        b=OoE0pHQkKhw4hvO00e7lyvZUJjgpBMreXb6Jk35+vlUH2IE5UYZqaqLSQHU/nibg6v
         ruXqxLbVMqM1vytrKhJtNrqEDD6h6rXPgBiryqmNYLC3IQnZIhuOS7TcPwGr5R7ygKs1
         lWTtvGDk6W0KewJgH+hGGwveddIggSzeYH22jvTTUIxPsmaKjGdaoU/MlO0VHJ95ibm8
         knVzbKenulkmq7F+9uZ5iBaho2oUTnB1Fx9YeiEBCInT5w6yq1OERaErbJt1TU1W9RXL
         JVbdr/2nbDQR2i1Zix/oN3aQ7XelMgfOCuorezM/K2rl/XlBSx5xdT0WppNl72JmrNT7
         FlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949357; x=1751554157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDTHGKJ7PRnQtifJssL8JUIIPtKYbrBYEt3PvsupNKg=;
        b=sx1wnVerxz+OcWXaFMzLuFfVxupdEj4/VzaRD+fbjUOrgrRZoDB+rsYpNyAR4weUos
         Sy19i2d/vzN2vc55G3TfdQhcKnH7nEy1KTzzKMQyi0HheaYVrUgBZmzyrN8ppY9mOIc8
         OH09X0sZ7FyaUw0q8quu/R9nwcTmRiAbx2qVI8v1JQjq6CNIacbqe6fjTVp1jafBOey4
         KGrviKuo0KHoCFX4unx3o7YIENgLa77xeDwxNjE1xBxN5oe/ZNQDzUw4vU823a//iCt1
         89o+FGDUs40B8PsllpYZGjPmOZq767rFWvFMXLquq5qjD/eibt3fWQWAB40DvmiazfWr
         Z0hQ==
X-Gm-Message-State: AOJu0Yx/NyLUqPk5VxHgD9JBJP4sK0YJOJoKTk7rsDG4iahoDTUvAc54
	fmddbwCinsVO71xbjoUxfz79skYKcEqpc/ahACgvWr5BQFl25Eh3kCZtyFZMiCp0xR0=
X-Gm-Gg: ASbGncutxeTcKCnsezMW+GTexyW3AX8H5NR5YTWxb/i1MObL3hNIw9Xwrn819HItuhQ
	p0lvvTzg3L184NbprfL8Nru9IM3nlgUJQQq2Xx1Tdk5kHkhhIBDK0HCaRLEFNh/xbhE+0yrs0QI
	6zVms5cS0FJZYK6FKN95OJ8zZC+O6SVjGtx35HQdqZ+E3jXNxXvjT6aK5ybbnQff+4Nqu7ZjRcL
	Ke3LFEKz9qqpNW00AAwESYRjf72aCQ18SgM2H1zJjNiOvGAG65BT6PeJSE8WMM4CXGXV7sLD9mF
	4lOgs8f46xJWQ9UX0L4ZY5nBlczaeuHrCcrTp0q/B0cBSkI=
X-Google-Smtp-Source: AGHT+IEk1fuPkxL2WLgf9P7Tgn7/Q5tUITHrfb7oE7/rJ7NBa+jsmVtdMJzdRWUlmWV91MQIQpsO/Q==
X-Received: by 2002:a05:6808:50ac:b0:406:7186:5114 with SMTP id 5614622812f47-40b05c73cf1mr5460261b6e.36.1750949357253;
        Thu, 26 Jun 2025 07:49:17 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c136ecsm2593994b6e.6.2025.06.26.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:49:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uUnud-00000001WeQ-0wX2;
	Thu, 26 Jun 2025 11:49:15 -0300
Date: Thu, 26 Jun 2025 11:49:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
	Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"open list:TPM DEVICE DRIVER" <linux-integrity@vger.kernel.org>,
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH] tpm: Create cleanup class for tpm_buf
Message-ID: <20250626144915.GD213144@ziepe.ca>
References: <20250625213757.1236570-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625213757.1236570-1-jarkko@kernel.org>

On Thu, Jun 26, 2025 at 12:37:56AM +0300, Jarkko Sakkinen wrote:
> @@ -323,7 +323,7 @@ unsigned long tpm1_calc_ordinal_duration(struct tpm_chip *chip, u32 ordinal)
>   */
>  static int tpm1_startup(struct tpm_chip *chip)
>  {
> -	struct tpm_buf buf;
> +	CLASS(tpm_buf, buf)();
>  	int rc;
>  
>  	dev_info(&chip->dev, "starting up the TPM manually\n");
> @@ -335,7 +335,6 @@ static int tpm1_startup(struct tpm_chip *chip)
>  	tpm_buf_append_u16(&buf, TPM_ST_CLEAR);
>  
>  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting to start the TPM");
> -	tpm_buf_destroy(&buf);
>  	return rc;
>  }

So, Linus has spoken negatively about just converting existing code to
use cleanup.h, fearful it would introduce more bugs.

I would certainly split this into more patches, and it would be nice
if something mechanical like coccinelle could do the change.

At least I would add the class and drop the tpm_buf_destroy() as one
patch, and another would be to cleanup any empty gotos.

Also, I think the style guide for cleanup.h is to not use the
variable block, so it should be more like:

CLASS(tpm_buf, buf)();
if (!tpm_buf)
   return -ENOMEM;

AFAICT, but that seems to be some kind of tribal knowledge.

Jason

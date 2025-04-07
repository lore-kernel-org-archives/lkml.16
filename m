Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2B6221F1A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013063; cv=none; b=F3N80gMKvO+uPGe8bUg9JxL6Ft5a8wgiDbtl88XIH7iNk6N4/b9Ypk5lOvjB7H6sUPnpvHHY6cMvWadMlC3b1/AaGsEONY7Miw8/dPgctg0WkXlSnErhKMTNSbz3X88hamPyUeIwcfBmtl2XyWb9sNDxidP5Jy8R+/tdC1KXXeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013063; c=relaxed/simple;
	bh=7TnCmTzEaSfvHUAap+DisKRcdPyBOGyfTTrwSA8XN+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D40z2rEzfI8vvRiEhtwWPw0/GuiI+Vx3pSlSxCqi9LVMuXr4pyaIr+xoHXIMNEzlNEqoWZwIA7TCSAz41zoeiB7BoSRe2ayKM+faQ4Pw7H3vcBPyZJ6SLnb0iEJ6fT3hcRyxnQHHmhSWbfF0b7dYwc7XbsaUDoie3od2GA4irSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AqWlNunH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AqWlNunH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744013060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8fp+goqsiDX/imKy8nA+uPVV6MYng1RFSM6Na0BmegY=;
	b=AqWlNunHJoSzjMprL4+rnnXjBJd+hpcJbD2ajY3ukI7A69G60EhKOWFqtHJTJMdDNdjClQ
	jQ0hqdaiMWMXNBolnxObv4Ej+jxBrtceoughoS/ETb7qTIDXoyUMzF1UTIFujCkjrKhkWB
	WkKKTFx0cMaGYR7fscXxoz8LR/J8rXM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-qRVqYNidPuaQRHo-dtghdw-1; Mon, 07 Apr 2025 04:04:17 -0400
X-MC-Unique: qRVqYNidPuaQRHo-dtghdw-1
X-Mimecast-MFC-AGG-ID: qRVqYNidPuaQRHo-dtghdw_1744013056
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39135d31ca4so2127037f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013056; x=1744617856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fp+goqsiDX/imKy8nA+uPVV6MYng1RFSM6Na0BmegY=;
        b=CFQheYePj8xLu8zNxxABXtFy9jIAGa3rtkVJ/nlAxaz9lg7r69LjSe1Rh+lKcNeW+Y
         gpRumGtaYu1m/zKzS242k8G+wgn6OB0BfYZ1eBWETNJc6MFyiF7OaXexz9WAjclFIN2c
         OVedzvbfz4PWnOXEjQ/GK9zTZ6Ilrs4usktmx7qzSSiNuQya2brLr8RI0tjVeBiNftpv
         U81v27qWvNMCZNwW4yOAF5Mv/UlFn7Au0S/EFFSzDcwAIiljVIucvojIVNmesstoKyBy
         qH6ZfDALiALQDuwe4ez8F/cYfXa1TmxU70wXn6oBr+TLP3yxTAUm3FHJb/2jg4b2zuaO
         ohfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgGFb8wcf4SoyB9yQbH1nA0e2yUHTb34OmCLFIzZlGu/rq4Rn5qNgn4Pqefz957xrLzmy5ZGdgU5KI7h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQZExHTNYodh3CwuPf2btbd5WAqX82JC+G7XdJv2Y+5zu94n6K
	1X18nOTNl7LbhC0KccH/8sk2xJdJz/0tX9tg4iSRmIY5tjtgXAYW8g3wi+FaO4lTG2hydPYmFbA
	rb8fTemP56M8VqJz//E2QeYzaz5E4UU6WEu4KdGyzyasNnQVtbUwKobLSR/Ri7A==
X-Gm-Gg: ASbGncsVCQGvLZcIgVIrj5irz80r9endGfzHVlSL0Z35J8uH3SH3AoCfJBpC0yobhC+
	hw5dSXT8IT1ssOESmW8RHMCWLPjBPNl0I22+hutQET7NrYDzKA492K3AM/jMyvdI2ISH/nDYZSq
	9+IdeSP7DiP1EHqCMj+YjQV0m0n14Ggz7mIU3EfHzL8RJL6ZtWkf3LWDia3/3wPALWwptJPlFXS
	7tFS8rmKB1Gaj8RRt8O3LJlcp2YURN0tIddemJ0yQybzGltAGRKCXiUXfI0gB7mlLwr8Cf+buZN
	E844m3VoA1Q9TPahlXW9W0dAY+uoBcpp4clhCVfv3+bz0Cpa9a8piVP9XIZFujo/
X-Received: by 2002:a5d:64ce:0:b0:39c:1f02:44d8 with SMTP id ffacd0b85a97d-39cb35a15f7mr9124854f8f.4.1744013055913;
        Mon, 07 Apr 2025 01:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQypbiq0xQEWAWYQHoKnyO1B74jcLwUjtWUKTnUrs/7VMKU20PoxRua8Xmc3N2Zu+6xDL37Q==
X-Received: by 2002:a5d:64ce:0:b0:39c:1f02:44d8 with SMTP id ffacd0b85a97d-39cb35a15f7mr9124805f8f.4.1744013055379;
        Mon, 07 Apr 2025 01:04:15 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d75335591sm5098018f8f.1.2025.04.07.01.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:04:14 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:04:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: keyrings@vger.kernel.org, stable@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Howells <dhowells@redhat.com>, 
	Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, 
	"David S. Miller" <davem@davemloft.net>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Ard Biesheuvel <ardb@kernel.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3] tpm: Mask TPM RC in tpm2_start_auth_session()
Message-ID: <2mjtwprr3dujf4wbu5licb3jtzxujimcz5iahrgqymu6znwbbq@cslxwt7ejva3>
References: <20250407071731.78915-1-jarkko@kernel.org>
 <20250407072057.81062-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250407072057.81062-1-jarkko@kernel.org>

On Mon, Apr 07, 2025 at 10:20:57AM +0300, Jarkko Sakkinen wrote:
>tpm2_start_auth_session() does not mask TPM RC correctly from the callers:
>
>[   28.766528] tpm tpm0: A TPM error (2307) occurred start auth session
>
>Process TPM RCs inside tpm2_start_auth_session(), and map them to POSIX
>error codes.
>
>Cc: stable@vger.kernel.org # v6.10+
>Fixes: 699e3efd6c64 ("tpm: Add HMAC session start and end functions")
>Reported-by: Herbert Xu <herbert@gondor.apana.org.au>
>Closes: https://lore.kernel.org/linux-integrity/Z_NgdRHuTKP6JK--@gondor.apana.org.au/
>Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>---
>v3:
>- rc > 0
>v2:
>- Investigate TPM rc only after destroying tpm_buf.
>---
> drivers/char/tpm/tpm2-sessions.c | 31 +++++++++++++++++--------------
> include/linux/tpm.h              |  1 +
> 2 files changed, 18 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-sessions.c
>index 3f89635ba5e8..abd54fb0a45a 100644
>--- a/drivers/char/tpm/tpm2-sessions.c
>+++ b/drivers/char/tpm/tpm2-sessions.c
>@@ -40,11 +40,6 @@
>  *
>  * These are the usage functions:
>  *
>- * tpm2_start_auth_session() which allocates the opaque auth structure
>- *	and gets a session from the TPM.  This must be called before
>- *	any of the following functions.  The session is protected by a
>- *	session_key which is derived from a random salt value
>- *	encrypted to the NULL seed.
>  * tpm2_end_auth_session() kills the session and frees the resources.
>  *	Under normal operation this function is done by
>  *	tpm_buf_check_hmac_response(), so this is only to be used on
>@@ -963,16 +958,13 @@ static int tpm2_load_null(struct tpm_chip *chip, u32 *null_key)
> }
>
> /**
>- * tpm2_start_auth_session() - create a HMAC authentication session with the TPM
>- * @chip: the TPM chip structure to create the session with
>+ * tpm2_start_auth_session() - Create an a HMAC authentication session
>+ * @chip:	A TPM chip
>  *
>- * This function loads the NULL seed from its saved context and starts
>- * an authentication session on the null seed, fills in the
>- * @chip->auth structure to contain all the session details necessary
>- * for performing the HMAC, encrypt and decrypt operations and
>- * returns.  The NULL seed is flushed before this function returns.
>+ * Loads the ephemeral key (null seed), and starts an HMAC authenticated
>+ * session. The null seed is flushed before the return.
>  *
>- * Return: zero on success or actual error encountered.
>+ * Returns zero on success, or a POSIX error code.
>  */
> int tpm2_start_auth_session(struct tpm_chip *chip)
> {
>@@ -1024,7 +1016,7 @@ int tpm2_start_auth_session(struct tpm_chip *chip)
> 	/* hash algorithm for session */
> 	tpm_buf_append_u16(&buf, TPM_ALG_SHA256);
>
>-	rc = tpm_transmit_cmd(chip, &buf, 0, "start auth session");
>+	rc = tpm_transmit_cmd(chip, &buf, 0, "StartAuthSession");
> 	tpm2_flush_context(chip, null_key);
>
> 	if (rc == TPM2_RC_SUCCESS)
>@@ -1032,6 +1024,17 @@ int tpm2_start_auth_session(struct tpm_chip *chip)
>
> 	tpm_buf_destroy(&buf);
>
>+	if (rc > 0) {

To avoid the nesting blocks, can we include `TPM2_RC_SUCCESS` case in 
the switch or move the `if (rc == TPM2_RC_SUCCESS)` before it?

Thanks,
Stefano

>+		switch (rc) {
>+		case TPM2_RC_SESSION_MEMORY:
>+			rc = -ENOMEM;
>+			goto out;
>+		default:
>+			rc = -EFAULT;
>+			goto out;
>+		}
>+	}
>+
> 	if (rc == TPM2_RC_SUCCESS) {
> 		chip->auth = auth;
> 		return 0;
>diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>index 6c3125300c00..c1d3d60b416f 100644
>--- a/include/linux/tpm.h
>+++ b/include/linux/tpm.h
>@@ -257,6 +257,7 @@ enum tpm2_return_codes {
> 	TPM2_RC_TESTING		= 0x090A, /* RC_WARN */
> 	TPM2_RC_REFERENCE_H0	= 0x0910,
> 	TPM2_RC_RETRY		= 0x0922,
>+	TPM2_RC_SESSION_MEMORY	= 0x0903,
> };
>
> enum tpm2_command_codes {
>-- 
>2.39.5
>
>


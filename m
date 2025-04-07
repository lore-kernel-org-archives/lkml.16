Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC3E35976
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033892; cv=none; b=Uf8x585qxTisFvbs+M5v7BHmm8azBXAm+L9VBmsfya6KiilIg0sKNBT0Hbu7zgH3Wne50aYDDICZkWQQFcRkABf0+ihid2CXQHLWJkjGM5E6Nc9NXVTb2uS5yuuM3WQzC6McUlXIeowwdXUAo/kJdzV9A5nBaGl8NcF2B4/Jlyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033892; c=relaxed/simple;
	bh=pOlUfoxKMdcIvFibY4XcyydBHsdZrFh189zmiV4sVgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxFhxVW3BiJKGA8Ng0HEvGyAtInLWQ1QhWZK2CvMIPlx+ahv69hYKg0Qgpis7Y6H8K/YVfl6/EqLbiMl53xpLK21Wsne9PppzzI/qlb9oIc0qdcBTp1+rlnGWFqDn3FEIEX860Ugh0wT1zekJP7cx3fw/KPqzox5xgYz8WIC+qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gTvboEzB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gTvboEzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744033889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4QozE0PDtnnSmD6ILxl3+T7V2hUuUMgoSOAUqOydwIc=;
	b=gTvboEzBP1vUA90gwThhdSnHRRq25jwcPMYyhdZ/dcVqrfn8v+P7zmFo26elS+IAw4K/l1
	CRMMzRZPZ+J9FrEu1crJzpGyeyQgeqznseZsEcFeYmdLalyP9BKKYnaHC2ZfvtfGmye5KH
	+jvJEWeKB9OiPhloldFbunAT5+uBkHI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-CBmAwrH7OYuuOHwq0gzX4A-1; Mon, 07 Apr 2025 09:51:28 -0400
X-MC-Unique: CBmAwrH7OYuuOHwq0gzX4A-1
X-Mimecast-MFC-AGG-ID: CBmAwrH7OYuuOHwq0gzX4A_1744033887
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso26632645e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033887; x=1744638687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QozE0PDtnnSmD6ILxl3+T7V2hUuUMgoSOAUqOydwIc=;
        b=BIhj8G/tHOqve53kIYNVzWQrme63AIHpQvNlcDV/kGTtCuW9xT69j0Qp5bmCw35rtK
         MYPcsfwh+SXMHvvgt/CjLkAz8Paq0bhmK3xB95jqZWN+rOwy14R3+SnkTJBwEzj7f5My
         HV1H0WSuKHxWab2KYUERNyfQMhn3HKH90rC5YRJWJKlRV8V8NX7a40dBUs48grqp4EUW
         cHCbpia8MeGve+VvAiEVAGEz96tnj61LvWZm1zEF+/OB1M5zhLUxrDeQ4oVXwadSPJ1i
         2rXQK5onKx5FkZKiytcHUrKA4nO7VIDwGwqIWQAnYDMdF6C7hpBYb6Vw4tvVLxdCLLgC
         P1Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXqnqNR9+vhKLp1/dnjWtibk+OBMvWq9VsL5EOkxlSu4adgRZ03Wpjwtja95Iqjwi9Ffa4YQl5DdlMA7tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNrj5g1HYTQhyi89z11KXlh3C4iqgF2hk/J7iVCOvTIC8DvhNq
	T3aRk8RNK0mk+c+oWS1+i0CgvaVw/+nJ39AxOdge2EriPk/Gfjf5Py1poVHmiTWTifZkqX5JYvZ
	ZdGoqo/wBiQgAnVQ1BYyDDYOkVFtgSkrUjX9v5AjIxK6wHbbMexUyK9PquUd+/A==
X-Gm-Gg: ASbGncurPeWU9X9PxBfSBXGjl54v4YCqVCY8m2QfwwB8sjvnmLYf97EP043WjChn7u0
	SnP/Acn8ZReYBZLHHbLzPM0w6nclI/aQwpsorHCt1fGh5PHTscGt0nJapRPtcKqsEG3CAledXe6
	+fmDlFuMnLOgsYgN7ffpWMo6sq8hG2hFo9v+fLmJ6KOV8zJPeF1GQOS3+Px2PeVnVPstkZvJPN5
	MnrR1Dtn/6ADojq41agVQmk+4aQKDWF5hXsEti63xomzP76IKoOWoOGjegvcFx70V0y4wI7OP5M
	zRfk+uE1CtJPeur7N9sVZcLOinIHxkN/Ef8Zb0MbopVS+RlXtulcdpnYFwhTzBcz
X-Received: by 2002:a05:600c:3109:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-43ecf85fb61mr113063735e9.14.1744033887033;
        Mon, 07 Apr 2025 06:51:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWKfH/L/DqQU6vxaZkSWgWxiOUkaiLhr+XQUhQs80d/mT6RMww2aM39izGLVjowZVzDnOYDQ==
X-Received: by 2002:a05:600c:3109:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-43ecf85fb61mr113063395e9.14.1744033886549;
        Mon, 07 Apr 2025 06:51:26 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d2bc7fsm95414515e9.0.2025.04.07.06.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:51:26 -0700 (PDT)
Date: Mon, 7 Apr 2025 15:51:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: keyrings@vger.kernel.org, stable@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Howells <dhowells@redhat.com>, 
	Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, 
	"David S. Miller" <davem@davemloft.net>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4] tpm: Mask TPM RC in tpm2_start_auth_session()
Message-ID: <e7ul3n3rwvv3xiyiaf4dv5x7kbtcgb6zpcf33k6dobxf5ctdyp@z5iwi4pofj7h>
References: <20250407072057.81062-1-jarkko@kernel.org>
 <20250407122806.15400-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250407122806.15400-1-jarkko@kernel.org>

On Mon, Apr 07, 2025 at 03:28:05PM +0300, Jarkko Sakkinen wrote:
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
>v4:
>- tpm_to_ret()
>v3:
>- rc > 0
>v2:
>- Investigate TPM rc only after destroying tpm_buf.
>---
> drivers/char/tpm/tpm2-sessions.c | 20 ++++++--------------
> include/linux/tpm.h              | 21 +++++++++++++++++++++
> 2 files changed, 27 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-sessions.c
>index 3f89635ba5e8..102e099f22c1 100644
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
>+	rc = tpm_to_ret(tpm_transmit_cmd(chip, &buf, 0, "StartAuthSession"));
> 	tpm2_flush_context(chip, null_key);
>
> 	if (rc == TPM2_RC_SUCCESS)
>diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>index 6c3125300c00..c826d5a9d894 100644
>--- a/include/linux/tpm.h
>+++ b/include/linux/tpm.h
>@@ -257,8 +257,29 @@ enum tpm2_return_codes {
> 	TPM2_RC_TESTING		= 0x090A, /* RC_WARN */
> 	TPM2_RC_REFERENCE_H0	= 0x0910,
> 	TPM2_RC_RETRY		= 0x0922,
>+	TPM2_RC_SESSION_MEMORY	= 0x0903,

nit: the other values are in ascending order, should we keep it or is it 
not important?

(more a question for me than for the patch)

> };
>
>+/*
>+ * Convert a return value from tpm_transmit_cmd() to a POSIX return value. The
>+ * fallback return value is -EFAULT.
>+ */
>+static inline ssize_t tpm_to_ret(ssize_t ret)
>+{
>+	/* Already a POSIX error: */
>+	if (ret < 0)
>+		return ret;
>+
>+	switch (ret) {
>+	case TPM2_RC_SUCCESS:
>+		return 0;
>+	case TPM2_RC_SESSION_MEMORY:
>+		return -ENOMEM;
>+	default:
>+		return -EFAULT;
>+	}
>+}

I like this and in the future we could reuse it in different places like 
tpm2_load_context() and tpm2_save_context().

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


BTW for my understading, looking at that code (sorry if the answer is 
obvious, but I'm learning) I'm confused about the use of 
tpm2_rc_value().

For example in tpm2_load_context() we have:

     	rc = tpm_transmit_cmd(chip, &tbuf, 4, NULL);
     	...
	} else if (tpm2_rc_value(rc) == TPM2_RC_HANDLE ||
		   rc == TPM2_RC_REFERENCE_H0) {

While in tpm2_save_context(), we have:

	rc = tpm_transmit_cmd(chip, &tbuf, 0, NULL);
	...
	} else if (tpm2_rc_value(rc) == TPM2_RC_REFERENCE_H0) {

So to check TPM2_RC_REFERENCE_H0 we are using tpm2_rc_value() only 
sometimes, what's the reason?

Thanks,
Stefano


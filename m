Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264D221420F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714157; cv=none; b=gv1gzOUv1LqwLoCKwXA4pdkLwFrFTk4bIOdyCMxbVCMfN7HgeXSZu5GoS1pzuDrRSaHBTIoWtf5NeI+Z4w8wbBJ+YJx3AHY8p6uwEnKVyTxPGywhczOv70LIa8DC7ELHkwZLJ1QphG24vy5o//UvdBIx7oVZlTQ2sAqEfQdqby8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714157; c=relaxed/simple;
	bh=liD84H33mldJ5FwcAo5b42k0QKzep4H4rmYW/0tE3Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixM5j4fek/yWqHGTi/n3EZLMG2YH78Bs/SCE/Pzex37IaeWCAwVbwD2ICRt31hetOnl5bjVMRZAvoFE0ysOYWGaLkR6ouh4nPzebKfayZdHnbldy1D7mGpPTpl45yjuQeI/yLyTJs8I45tbsSQNIHU7N+pQoYU9DsFimsxQQlvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RB7mHz2P; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RB7mHz2P"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so579137f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749714154; x=1750318954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pOjdW6tvwIHGvqgEBjcYXxpqXXP0mM93Bi1E5VHKi0I=;
        b=RB7mHz2P2F0km9hNYYtu3w9W1j0fp/y1iV6+QIlaCDcvOSzig+rw9sfzzBLqoNB9My
         FC0BFiaK7emHFD9TfA3KoCEgVCMmooWs5v8kXWeJxYp0GXatPBKkxRo96PLPF6be1G70
         wLKRi4UcC1JJWBC9uNDWrtn9j2csf4afhir3kvjc+p4qP6Xck5DJsdbimN2+fS8KekDG
         wMVUbeTYauqAoKxVs/4Ljj2jEwi44JjRtkG58FmM7ZcHmw+95RfQ+1ZkGYPgww5xTQUV
         u7aKlNpEpnGPTunoHhOsXFFONPmfcpcL0onPOS4cxzaEC+EgcOJnsj8re5KGWIqnoJHj
         M2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714154; x=1750318954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOjdW6tvwIHGvqgEBjcYXxpqXXP0mM93Bi1E5VHKi0I=;
        b=Cu8f+pnEgfEhwI0evKmeJs5NTojxpzLQsWxkvFpsTROY0FeXH9Cu47JC2iVL/Z2ecE
         hfKN2ABSqziwLB4x74OjWVm6P/QpQNA5L65wwAZ/73rm3Yex9+uHZSCRuqUzNP1LPZJ/
         Nnk2KSfUmjHcEj5gt/Sq5OiuxmOcz6oJdPVcgLAiw+ehD0J4wKebmci4oZABu39udBty
         Dx5sRPhoMhmX9N/KmLeWG6nXQ/eNsFe9IrFZAb0ojpWyOGoUpKKILNSss7hTwiTYXdtt
         TFhVALZSE+ziuvDZQDBkJvBdeiUpYZYHC2K73pbWvHMyEbFaEIIDZyk0pkHFMdWuvmfm
         /Nyw==
X-Forwarded-Encrypted: i=1; AJvYcCUvmlCP1UonQKisTh5PM8CRSlrZHRTb2xK/cujJU51W4/QAkoqEpD5qtmEMnzp7feF42wGH+kMh0HJw54Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Or+UKfUygvFzbVMFxMjOqHrryu8Bvcl3jtcMp9U9W2bVM6u6
	jTDYY8oBpcOeKkXhIqkcYpA8C2wKYmF4CFTReKG95jlfnsmukXqSRD8QZ16HJBanB+k=
X-Gm-Gg: ASbGncugxNb/5KBP31dipBSX4AZLA2iFn/Kjnqy0XaO1Q+bbvfudprfblkTOgPbYXfQ
	l0TgG/XbQNkvzDMA9OaG3HxaXAhQNYhRzY7wqkfkS0f0av8ShOOCOR9XUbNHFxES5ldumzcauGy
	55/7bAj6ckmilP18GcMJR/wktF8NWaZrj0rWTLdD6E/xDYlMz6DPSsUpT+Ehmd7NMH8mDds35c5
	P6ZmufsOGxIZ06WVYaScYWSulvaw4HQ/FbtLp0WVSwnGo4Z6FutJLbOGzupytqCSZ1iqX6Dc+pK
	aA4xmI6WCiIfepJLLo3WCV95Rilw8R1UmYtJJvD8tJBWHve5QvEZmrp5VtU07fTB8H0=
X-Google-Smtp-Source: AGHT+IHK4uQuCn2XQWMjU/bTqraytEDLe7/LB0UXdjlju8466jLpB8n5+oghPZtv4fc6nLejDkqEyw==
X-Received: by 2002:a05:6000:2308:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3a56127883dmr1425617f8f.13.1749714154457;
        Thu, 12 Jun 2025 00:42:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453305a0d9dsm3836115e9.21.2025.06.12.00.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:42:34 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:42:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karan Tilak Kumar <kartilak@cisco.com>
Cc: sebaddel@cisco.com, arulponn@cisco.com, djhawar@cisco.com,
	gcboffa@cisco.com, mkai2@cisco.com, satishkh@cisco.com,
	aeasi@cisco.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	jmeneghi@redhat.com, revers@redhat.com, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/5] scsi: fnic: Fix crash in fnic_wq_cmpl_handler
 when FDMI times out
Message-ID: <aEqE5okf2jfV9kwt@stanley.mountain>
References: <20250612004426.4661-1-kartilak@cisco.com>
 <20250612004426.4661-2-kartilak@cisco.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612004426.4661-2-kartilak@cisco.com>

On Wed, Jun 11, 2025 at 05:44:23PM -0700, Karan Tilak Kumar wrote:
> When both the RHBA and RPA FDMI requests time out, fnic reuses a frame
> to send ABTS for each of them. On send completion, this causes an
> attempt to free the same frame twice that leads to a crash.
> 
> Fix crash by allocating separate frames for RHBA and RPA,
> and modify ABTS logic accordingly.
> 
> Tested by checking MDS for FDMI information.
> Tested by using instrumented driver to:
> Drop PLOGI response
> Drop RHBA response
> Drop RPA response
> Drop RHBA and RPA response
> Drop PLOGI response + ABTS response
> Drop RHBA response + ABTS response
> Drop RPA response + ABTS response
> Drop RHBA and RPA response + ABTS response for both of them
> 
> Fixes: 09c1e6ab4ab2 ("scsi: fnic: Add and integrate support for FDMI")
> Reviewed-by: Sesidhar Baddela <sebaddel@cisco.com>
> Reviewed-by: Arulprabhu Ponnusamy <arulponn@cisco.com>
> Reviewed-by: Gian Carlo Boffa <gcboffa@cisco.com>
> Tested-by: Arun Easi <aeasi@cisco.com>
> Co-developed-by: Arun Easi <aeasi@cisco.com>
> Signed-off-by: Arun Easi <aeasi@cisco.com>
> Tested-by: Karan Tilak Kumar <kartilak@cisco.com>
> Cc: <stable@vger.kernel.org> # 6.14.x Please see patch description

I'm a bit confused.  Why do we need to specify 6.14.x?  I would have
assumed that the Fixes tag was enough information.  What are we supposed
to see in the patch description?

I suspect you're making this too complicated...  Just put
Cc: <stable@vger.kernel.org> and a Fixes tag and let the scripts figure
it out.  Or put in the commit description, "The Fixes tag points to
an older kernel because XXX but really this should only be backported
to 6.14.x because YYY."

regards,
dan carpenter


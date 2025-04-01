Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067362046AD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515981; cv=none; b=ST9Sg8Qj3dNDdJCr3gpLNs0BHTqbM+YGA3GEYujOjXI9yIvzRGdfNduZdWfjyQRoJ21qJnMSS6e7PwislgJqfxnk8tGWX/3WWwSf1Ha+EXpP1K2xIYXFK3jNeTpgMa5Txx/HaN7bKqJ7mRFUx+KhlnAdvxm9FylGzmv7LGfUrQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515981; c=relaxed/simple;
	bh=hDLzqRPsoDGnUdms0LQYvaYmGEbT2S3EwsAgwQYZnT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfxFEOtlF+mMCCxKgEEmJQLFzqPE6DrIIhdJ8OPnb6HokrmBocPTXRZUI9uErpmj6bdGLto80BKOs5pLvQ9iSosjAvPVXX1eVe93g5Onr8ku55tLdnu4nbpS/kA0vNEk7rsBLai7enNJ63jCV6/7V9xsqNSsTAFyRSiE1Fzk+z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nc3qaYli; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nc3qaYli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743515978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t2IgA5uO8titoAWyijzoucLkCRmrJQPxxk3pK7glj/g=;
	b=Nc3qaYli77fk94B2Iltg+UoQtHZMDsV+eV+sHgZsFGEt8ruSABBk+ILPO4INxqj+vm9nKC
	sqGrMQ8l8jLuk92p2lJTGIkifeqSM0954vTZehYw2WWZ+TGDJvImwEuRHkHGqnPaNcF3bY
	vbvFfshrHmTEkP/JCu31jisnwENQR+M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-umA22UiMM1KcEZjPnT00Zg-1; Tue, 01 Apr 2025 09:59:37 -0400
X-MC-Unique: umA22UiMM1KcEZjPnT00Zg-1
X-Mimecast-MFC-AGG-ID: umA22UiMM1KcEZjPnT00Zg_1743515976
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913f97d115so2695670f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743515976; x=1744120776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2IgA5uO8titoAWyijzoucLkCRmrJQPxxk3pK7glj/g=;
        b=omW1lIC+ATWgYbESS30e6q+FkjDg9yyN8i8bO7CniLRJnnN2PpcMK6DUDPU9L7mtN9
         qV1Jb/8MDFdrWliDj19WvsSVs/NLHmQ2hEFM9MKVjTyu05Wj2pXIkXR/yEbal4A+73LX
         +c099LkzRTaZEC5lSixFLQnszCdwlqkItheAZw8MJy+sL8mPZmYlS6YGp8YcY1A+dK/H
         e2tk3cDkwBuo65jiLNTbd38GKoNlzA5AxEvEw5fyEc4ThUUGuNMs1r2KAwBHrAXcxQT9
         +A7WDfRoAca0W3q+XkKT1f5guxOt+d2ZMpT+tZNvkkHwpCZFBvk0yU775hz8jGx4mPom
         clhA==
X-Forwarded-Encrypted: i=1; AJvYcCWXqvg39wPqvtNEaC3Ky4eA7I1Aa9x9nC/jw62b4jfNkpPW0PYhoN7m6ES58MxCvak0oA9eR2+llw6ZQ+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIZhD05hd9ivu9zwpbVejHixcCSpxgR6Kh8cM2LZaV8L3BYy3G
	cjaJRfRWS5uVl09CdEUeaoXUDeC9fIFfpsKDxtGRhDHkLR7o67d0oMepOXxXCQxgsJBgtk1Bymv
	9GK57x+Y43/oD1HE0dAKJrHfk4oSkdgzpOpR3DBc5tOsT3E3E9Vf7ePrWz/QCcw==
X-Gm-Gg: ASbGncuILhR+0RTxvoMKfCf3pUvW8A1hA3arVjzDcyslJafCh/GjJ6q0j9Xl1g+BZFu
	CC590WZIaa9VP2LS86U6+vcCPdlLVIQk9HXi7iHUlicRItYsoaMAYhOrjIvrq24AOfb/ajVbb7l
	7MoGAmJxx0RBQhCBV4XLyPaMdU8xVPrqYpQFS02j7lcbVPuqbOValKyJQS75RfYxgGsAWGsoMxU
	nl9OCCH1lepscAyuBkfQ8vwJoYESt4chUNgCr+5bC075v+9HLHyeXyYoD/DvFqY+7Mk4+DOxDbx
	hYaUd9hk7X9vPwjNQ8OjwtfzZYldUOu07Ys2PzKItwgS9hJJcMEbq4uVDJ0=
X-Received: by 2002:a5d:584c:0:b0:39b:3c96:80df with SMTP id ffacd0b85a97d-39c27ee611bmr75398f8f.11.1743515976253;
        Tue, 01 Apr 2025 06:59:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF09FwfqnRb8UJMujFmXs/QqdYBJeJRX2YI3guWVQi2x8F5XNEe7ScWOGZy7YxSOXZw3qmefg==
X-Received: by 2002:a5d:584c:0:b0:39b:3c96:80df with SMTP id ffacd0b85a97d-39c27ee611bmr75369f8f.11.1743515975769;
        Tue, 01 Apr 2025 06:59:35 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6adf6sm198134245e9.15.2025.04.01.06.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:59:34 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:59:26 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v8 7/8] vhost: Add check for inherit_owner status
Message-ID: <d35istatjtnr42x4gwpwlgx627pl3ntqua3kde7fymtotl676i@jxxxkrii6rue>
References: <20250328100359.1306072-1-lulu@redhat.com>
 <20250328100359.1306072-8-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328100359.1306072-8-lulu@redhat.com>

On Fri, Mar 28, 2025 at 06:02:51PM +0800, Cindy Lu wrote:
>The VHOST_NEW_WORKER requires the inherit_owner
>setting to be true. So we need to add a check for this.
>
>Signed-off-by: Cindy Lu <lulu@redhat.com>
>---
> drivers/vhost/vhost.c | 7 +++++++
> 1 file changed, 7 insertions(+)

IMHO we should squash this patch also with the previous one, or do this 
before allowing the user to change inherit_owner, otherwise bisection 
can be broken.

Thanks,
Stefano

>
>diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
>index ff930c2e5b78..fb0c7fb43f78 100644
>--- a/drivers/vhost/vhost.c
>+++ b/drivers/vhost/vhost.c
>@@ -1018,6 +1018,13 @@ long vhost_worker_ioctl(struct vhost_dev *dev, unsigned int ioctl,
> 	switch (ioctl) {
> 	/* dev worker ioctls */
> 	case VHOST_NEW_WORKER:
>+		/*
>+		 * vhost_tasks will account for worker threads under the parent's
>+		 * NPROC value but kthreads do not. To avoid userspace overflowing
>+		 * the system with worker threads inherit_owner must be true.
>+		 */
>+		if (!dev->inherit_owner)
>+			return -EFAULT;
> 		ret = vhost_new_worker(dev, &state);
> 		if (!ret && copy_to_user(argp, &state, sizeof(state)))
> 			ret = -EFAULT;
>-- 
>2.45.0
>


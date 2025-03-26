Received: from mail-oo1-f97.google.com (mail-oo1-f97.google.com [209.85.161.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7A0219E8F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743030503; cv=none; b=JRy2I/50egRJwMRwGuPXVL3gDFtimnV13VbYRnr92Rk2gcwvedJ6z6L5EU4cjD9QqmtgSvPG9HfFalCagaDk0zC5vrjITRRuIjzfgeTXx8A9qS1HyqZn7Ua80ntRXP0NIzwkiXHPyWNsYIwSpDYgvyNomFGTbca6FiWbJ9SjCnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743030503; c=relaxed/simple;
	bh=UIucPY8Hw6s1pIjj0T40L+yyxKLaVSlySiCPpLn2cd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZaxbWpH3cB1/KATEK+TP/O9bIcHmt2UJdX3GlSWDzF9VFHbHXorJ4oCSFy1hsonbPFCiu3xUZjLIXjqY8p6a0W9NiRW1PjfzZgjnd1XKM/NaV08TRjpUh/V+AQWpxZ/9r1AsjFoNip51s2KoB0YeOs3ldFDIC4t5/ziXPzfHA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=S+CytnhC; arc=none smtp.client-ip=209.85.161.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="S+CytnhC"
Received: by mail-oo1-f97.google.com with SMTP id 006d021491bc7-601ad30bc0cso927909eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 16:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743030501; x=1743635301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rVT5gyP0OGTon/Wq3WnQYduId/TZ40NupCn3Es6UaA=;
        b=S+CytnhCujIqDOAGDu6jJWVwbefFUYR5QQE+QDd86pIuWCDioun9cgd9ZiHBxLEvmK
         9QG3drlbcLV6Ce94OMqta6qurINg8+hLrlu+E9+j9Kysi07LevrA3aUwVRPbL5jc8/Jp
         qPDoPa+bC9dwblkw/thRI11KCLH84Jvw7SdOrdvsRo88uD7w003kqNNHFvMEZoiDzImu
         YFD3LZJTrIDJcfBPq8sIFf9vAwRmSbDnzCcVNOVceBnNxny1JWpJZr1J2JaeNRjxw/3f
         jU7SH/Kd2nR8bbPSUwl0cuvZVjIQ8XyDosUPYl2/fDPOO4VOaJEondV5GCn/1ZS3zapb
         9Ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743030501; x=1743635301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rVT5gyP0OGTon/Wq3WnQYduId/TZ40NupCn3Es6UaA=;
        b=Yk8WKTFiIxtwMc1yxM1cXvrG8kQBtq+QX+d1yCyoA9r5atihpUq5WykmejQTJncTwN
         vOSOP/1trNhkd1jRsnmopYQ8hOvGX2Q6xsKBwLP1MG3GZrSkzmVOZy4ddkTbPlQwD3TV
         NAVKJLX4DkRZ54dIz1nM+uZU7hISpT5Opz02NKy0HbepjpKxg9GsjHGQ88z1fandWirg
         QcF/sjW2cdKVzbKeooT1IqTYB2VfMZViEFy0kHKQHAoEt2RDzmcUj+cwV9IDcjL9UW0R
         Aw2GYfjOmYS0pUR/3TX38A5j1yPrUxup/XCjjnD5xQEhkxcCF0fBwPDb4/KLco8NTIdq
         oGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpiz/rZSEx391Nep6Bb4cE+bGG4jVKUlTKnEtQy5l+zloRQrdtQe12Wh5qokWGGIg6Ckt/s6TNNmjSQ8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzipdkpCjqdNHD9F/8KK8TF7A6w/4LIEKEqPa8zrmNx6bN18ONC
	2dasmbaHze+ybHe3DTK8ao0H5vWKU8lMuKvQODoNUqnuxy+WERu4WTpk/wZuQNSZx1tUv6u3Tsb
	b35+Pb8/+C2ZF42WjRdU3LV9v7rE6O6lE
X-Gm-Gg: ASbGncuX4puvirIfyvaOrNmGuq3bjiWz+zRhPXybV+NiRILWhHkCdH9NQ59vwuR59RT
	IFCta4URKPfrex7+SD4wppIgc4x+tAuMhB8EHXr3hJCgZdqP7d7FLgNmV8p8w/CBPdeBTGS8yKQ
	LZ0NQ+PzkYSiI2ODx+XB6Xxh4rrgZxWTrFqD3jIPI4luUxgntKh0DnZI46bfXXrTVU9zweVqH2s
	HDr+HPztSkoJPCWBPb2JRo4gOKcFMGXLnoENAXPBJ5/gUSEUYT9dOaWYOxSG6qj7GFT9pEQ0TMb
	ESekhRWIYa8ecFLOpPtvkTn1/1npK5yY1lIiWuNFQLCBHHwc0Q==
X-Google-Smtp-Source: AGHT+IEPeX5QO7+np0lHt1JqQH6URXpDSCirYyHJkWTJBvVF0t+eQSx2Y6evgmmZSMAjZEj8DhgivwD6H6cm
X-Received: by 2002:a05:6870:2a45:b0:2c1:d516:66c1 with SMTP id 586e51a60fabf-2c826ccb975mr3678918fac.12.1743030500879;
        Wed, 26 Mar 2025 16:08:20 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-2c77f0ab523sm496151fac.37.2025.03.26.16.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 16:08:20 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 25C4C340199;
	Wed, 26 Mar 2025 17:08:19 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 153F7E40310; Wed, 26 Mar 2025 17:08:19 -0600 (MDT)
Date: Wed, 26 Mar 2025 17:08:19 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ublk: improve handling of saturated queues when ublk
 server exits
Message-ID: <Z+SI4x+0J52rCJpN@dev-ushankar.dev.purestorage.com>
References: <20250325-ublk_timeout-v1-0-262f0121a7bd@purestorage.com>
 <20250325-ublk_timeout-v1-4-262f0121a7bd@purestorage.com>
 <Z-OS2_J7o0NKHWmj@fedora>
 <Z+Q/SNmX+DpVQ5ir@dev-ushankar.dev.purestorage.com>
 <Z+RN+CPnWO69aJD5@dev-ushankar.dev.purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+RN+CPnWO69aJD5@dev-ushankar.dev.purestorage.com>

On Wed, Mar 26, 2025 at 12:56:56PM -0600, Uday Shankar wrote:
> On Wed, Mar 26, 2025 at 11:54:16AM -0600, Uday Shankar wrote:
> > > ublk_abort_requests() should be called only in case of queue dying,
> > > since ublk server may open & close the char device multiple times.
> > 
> > Sure that is technically possible, however is any real ublk server doing
> > this? Seems like a strange thing to do, and seems reasonable for the
> > driver to transition the device to the nosrv state (dead or recovery,
> > depending on flags) when the char device is closed, since in this case,
> > no one can be handling I/O anymore.
> 
> I see ublksrv itself is doing this :(
> 
> /* Wait until ublk device is setup by udev */
> static void ublksrv_check_dev(const struct ublksrv_ctrl_dev_info *info)
> {
> 	unsigned int max_time = 1000000, wait = 0;
> 	char buf[64];
> 
> 	snprintf(buf, 64, "%s%d", "/dev/ublkc", info->dev_id);
> 
> 	while (wait < max_time) {
> 		int fd = open(buf, O_RDWR);
> 
> 		if (fd > 0) {
> 			close(fd);
> 			break;
> 		}
> 
> 		usleep(100000);
> 		wait += 100000;
> 	}
> }
> 
> This seems related to some failures in ublksrv tests

Actually this is the only issue I'm seeing - after patching this up in
ublksrv, make T=generic test appears to pass - I don't see any logs
indicating failures, and no kernel panics.

So the question is, does this patch break existing ublk servers? It does
break ublksrv as shown above, but I think one could argue that the above
code is just testing for file existence, and it's a bit weird to do that
by opening and closing the file (especially given that it's a device
special file). It can be patched to just use access or something
instead.


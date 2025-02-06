Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6653C14;
	Thu,  6 Feb 2025 00:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738800815; cv=none; b=DXPrgfEgttR3Sfk3ZL/n9l/NJPJSyq9+ynU2Bz0Y5DOTj7GPkWGkSd3lRAb8bvecgHr76v60SFBRq2ceYcxYN2WFC/3ZSh2WsRl2sOHogxWCVi78h3iP4bi3KClyuRYL9vmczDJgXNGpB/GpEjSQQCk4am1EYGWBH7FvFnIPy9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738800815; c=relaxed/simple;
	bh=fh5UmQHTf2mYoOST39eVir9XhLv59fIGEMqzQRMeQO4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=Oln3OGUT0M6J0ZqYt/pAnZwYEF3vPGdgTOI2fc/uZ1y1eeL+EqnY97OqVrRPCIlIWKUoUzDrN52apoHkUzhesnVlM3EZ7Uvr6SL7vx7YYGxR8ENe4UU2QdAQLrB76t8Lv/IRxkUXy1S0EpCSYgfDWXUsmP2dw6M9EfEKtJSbXts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdqSjsP0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdqSjsP0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa68b513abcso72109366b.0;
        Wed, 05 Feb 2025 16:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738800812; x=1739405612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O68igwEieho1uX85bas/f125vFFAk3HGWTGsSbH8o1s=;
        b=bdqSjsP0tQjUwu0uV8B6guB2b/NaR2RHVSOCCmnlt8OBOirmEpQP1Q8ReFPtcqPaYG
         bJzP7FnlDLQS37v3saXUaVBbCDkRgTvqCP2DGH66cMgbBXtmFSCT6Wfd444ozIqx1aKz
         c/SLMWZFBIy23XWCIiEq1QXMu7Y8Xw7kgsOsKMWH3D4s+qyMBA8VnhnCzQ+wg5O9GjZw
         CDeCGNypxw8IA8lLuEckxHMRJOK+7LBpprzUyhvGsQ8/lBZCAIF/p5iQok2z5OAOtfCt
         T35ew3nX93P4iy2uGnfZ3ItqEAkQuJgyb11VWBJr4entsUTcoqHoNbHtWg8+QTet3F+i
         WF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738800812; x=1739405612;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O68igwEieho1uX85bas/f125vFFAk3HGWTGsSbH8o1s=;
        b=TyhG14dk20zZloriTIT+wCgeCoxmkdjSUQrndpN/O5lVNOCsvXDD6NF2hKPVZf9KfP
         Xod0Px2w8fZ4FLwDkQR3UVShJKJMiopTIQ6cfALvfvLDiTg6sqqkUR7ZsRODo6ZCnKEn
         q/JrhW8WYtkeDa2sVgYOlAwWvxQlw9RKfNmzEhtswgFNLOZn1NIHJe7qc5GXsatY88gE
         RF3aDgoHJBjSQ2yRy7o3IH1KCqnPI6P0ZK+u+8nSrVxIQflHe8BpczZfALeF1z1/rJ5J
         yPekmz++sVFCABsky400i41s3OhHBvnKxzQ8ZWUn32RdapjK+9qh4PAuVPqGWso/NLam
         1uoA==
X-Forwarded-Encrypted: i=1; AJvYcCUkCd2DYISgNOBGMQYzNB3YCo6d466D3HLR97NJoS6Dk8vyT+pWKuozSlflnBN/3ZKeCAJvbKiVodaxocM=@vger.kernel.org, AJvYcCXxw+N0cd4Cg0vbCnE8SxScJZrfdzL7u4ahsmQkETE5505/0VaIYfp+zAzmBxOui3L1we4jBqL3c57l@vger.kernel.org, AJvYcCXzmEJOxSw/jSCsn4sLPOv2kGInmYH2Fs+5LrwKPYiQxU/u58gr7PlXY6nLx4l9U5o1Ium3o4vukL8h/Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsl0sRkqd958Zr6W+MhSOtzhwwtJ6NaJp2kLUaa2JR4o6u9GZC
	MWm35xHLeVqYY2NYGkTgggGcbOTrK9HzlI03y0498unDxmG40dmu
X-Gm-Gg: ASbGnctrywUsknYa6HvrXSET+ou6XXw9DfPcL34pN6BQOGy+MB5Jv/wCxYEtZCwv/jt
	rCxKHA5YYr3Z7YrVsh/La2P1rWoxxFRky3VHQBiNPuvaS7yjLgbBFGeqjWWh8qt18RZxJ5mWPWq
	zE+4f/10VQD2UYSsBFeD4SwhUEXLXpnvDbzyShZRWN/rqf5kwO7IpkB5Wycyur169CZtYyFOhPk
	bluc7NTBPyXE+jthVpCFhW2XzpnqvqL0CcDRn4HRM4mIudeLba7aE0wIccvJfiXaHKuECT0ACS5
	7amOaJKeaXH9XwtG0xSXlITF8jX6tdWl
X-Google-Smtp-Source: AGHT+IHRyBKWo3lf9aNF51Ql5+A8wtiVqgxzfZTVU9+gLZhyNzzKaeV3ntRd4L9W0hlJUV/EUvDvHw==
X-Received: by 2002:a17:907:980a:b0:ab7:5a5f:115 with SMTP id a640c23a62f3a-ab75e362604mr496154266b.49.1738800812055;
        Wed, 05 Feb 2025 16:13:32 -0800 (PST)
Received: from foxbook (adtt137.neoplus.adsl.tpnet.pl. [79.185.231.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm9663066b.143.2025.02.05.16.13.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 05 Feb 2025 16:13:30 -0800 (PST)
Date: Thu, 6 Feb 2025 01:13:24 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: guanyulin@google.com
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, kekrby@gmail.com,
 lijiayi@kylinos.cn, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, oneukum@suse.com, perex@perex.cz,
 quic_jjohnson@quicinc.com, ricardo@marliere.net, stern@rowland.harvard.edu,
 sumit.garg@linaro.org, tiwai@suse.com
Subject: Re: [PATCH v9 5/5] usb: host: enable USB offload during system
 sleep
Message-ID: <20250206011324.4729b548@foxbook>
In-Reply-To: <20250117145145.3093352-6-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> - not flushing the endpoints of actively offloaded USB devices. Given
>   that the USB devices is used by another entity, unilaterally flush
>   the endpoint might lead to unexpected behavior on another entity.

This doesn't seem right, because flushing applies to URBs managed by
the kernel, so it should have no effect on offloaded endpoints.

As far as I understand from your earlier discussion with Alan Stern,
the real reason is that it disrupted operation of class drivers, in
particular causing kernel-managed interrupt endpoints not to be polled
during suspend and some events were being lost.

Or maybe the real problem was that if the INT IN endpoint isn't being
polled, device events don't trigger xHCI IRQs that wake up the CPU?


And by the way, usb_hcd_flush_endpoint() doc states that no new URBs
may be submitted during this call. I wonder if this can be guaranteed
if the interface has not been suspended first? Perhaps this alone is
good reason not to flush.

Regards,
Michal

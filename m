Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C92949F1
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301198; cv=none; b=eJYfCKPJr6QRvMDDXd6Y9eLyHZTytw3DLuFY9QC9OG3CLzFosct+Oh7qbJE2cjaHTYZ9Plcf7qcaADwu5bheroZAthHq8uA5uzykLYS3wNSaWx7zoPz/0Z1kyE9tilpiy46rh4jzmNV3T6j499T3nlYWaEI0TTwsJ1QAsYgWQfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301198; c=relaxed/simple;
	bh=/1mZkg9E1CztpAIZTDXcSM72W7GdGrTSeNoLQv6fDzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vD8DBd8idKeuVLnWwbL2Ipv3S6f4Yp9vhq50puG850q1eQHU8Q0y/NZ50MIFhYwUh4yrLqNWNNHhamMMTrr/xqdFEb3l/x9ST5l5BN7i7wM3/kJ/K2jd2F3kLWnueu6otu2hiinOlsgTrcgNA55pXLxjTDlPwA0mNm8SDvjSeg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c2eFQ16M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c2eFQ16M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751301195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tTsSQg95XhUJtNWRtD1zSv7COm3LSbhhvPf6ApdLYIE=;
	b=c2eFQ16MOvF1euVEwDmldNdkGsbq/kGtVw4Ai/OEbf3yadQIX9RD37oJrgbZPq82Px6IAX
	XxM4r66qiiwVF6hQ+Bc0iEBb4uTyMZ9KF8q2GbKzJ9D26BKIlCk3xtu5nV8zco/S34afQV
	UiRiK0JgfRKTOjBxxRfOytPf/1BpgX4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-Et7HjF4WO4-IG-QFYIOkPQ-1; Mon, 30 Jun 2025 12:33:12 -0400
X-MC-Unique: Et7HjF4WO4-IG-QFYIOkPQ-1
X-Mimecast-MFC-AGG-ID: Et7HjF4WO4-IG-QFYIOkPQ_1751301192
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso14061545e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301191; x=1751905991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTsSQg95XhUJtNWRtD1zSv7COm3LSbhhvPf6ApdLYIE=;
        b=hnwUymXCF3Tn7C78o8tCURhrFhNz8osJrizeSNfnJCzHBlinVuOsna0I2ZHF8Rv1ei
         m3+OtOIq3MjljTMhCSV1pEQp3CTi3dDIfRe7Ggy08jlTwIndlmDihU1lYHevJTpzBul0
         NiaQgIl9RubA0RehZjtejnwXy1b6nAIFqp6Te6fr8voOS3scpIYAGW177NbQLLlsoTtn
         QkU4jB7NlAoimWGXdDmPmPNJLqW5zyx7cSvzwp+boptp4kgrk1qGibj3wEeU41/8lTSR
         29jbMoCquasD+ownQLynUsc4Qawgc9gQx+oLUXZp66jjwHiYwc2tV8Tot/SYEx6N7XPg
         LXhA==
X-Forwarded-Encrypted: i=1; AJvYcCVwyK4p6d7/y3qkvokAL9OV+2WhTAwZmOd1855INvmlRB6WhibIkKMSFT/o+yTychKzM0zSw2ZhRmLHwW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8PcT8PrxrVOY/TDv/vWRaW+ONJTvEe5Tj0CAQ2E3b/1VE7Bx
	V0hM5BaIu/isB8Nf2KmqnFcoEGqMEkmudVhAY1iXtgqOCGRnMLLnLD90SWFVTLGLZxj7mGZw/iy
	1Bj2rEbCrewwo7Bl/6zo7G6laQXc5t31iwFOsemCglLrk8BgxioywvNbh1V8djkdo7Q==
X-Gm-Gg: ASbGnctnVU4nyiQbTWI+DqwdTXDaS57kBGoHSpkRhvgue4Ew2K5gTQFIWdkwFCVeD4i
	OmZ9cAs5gGdBl3l38wfIH0LbWtW3dVTRTWA3B25hNj4YJjH/C4M0jwhdlA5kIA70J6DMei+kbdg
	+c7q9ez9Mn4dw9fPN82At7r/JsdrNyY1ZyoqRly+DdIxFa5Z5LsyP8TEmgTO1h9wp2kIdKIDg8K
	J9e30iYRyNyuf6fyeaVupENn247IrdXhYkmvFQRuTv9RA81mXLQlfllXrY8LhRq60nfctEMOPjL
	u9LSjcaAHn6qIuSyZcOkOatNdm5fj1As3Vyssqvjitd4QhV/iBR/5w==
X-Received: by 2002:a05:600c:5298:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-4538ee61e72mr107704305e9.20.1751301191454;
        Mon, 30 Jun 2025 09:33:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfyROXvO4meZTA+eBrF6ZQx2AlPL1v9K81ASsw27IwZVehxZ2JH+GDPwndnAfiwnao4RKYTA==
X-Received: by 2002:a05:600c:5298:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-4538ee61e72mr107704055e9.20.1751301191020;
        Mon, 30 Jun 2025 09:33:11 -0700 (PDT)
Received: from lleonard-thinkpadp16vgen1.rmtit.csb ([176.206.17.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm142554375e9.30.2025.06.30.09.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:33:10 -0700 (PDT)
From: Luigi Leonardi <leonardi@redhat.com>
Date: Mon, 30 Jun 2025 18:33:03 +0200
Subject: [PATCH net-next v5 1/2] vsock/test: Add macros to identify
 transports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-test_vsock-v5-1-2492e141e80b@redhat.com>
References: <20250630-test_vsock-v5-0-2492e141e80b@redhat.com>
In-Reply-To: <20250630-test_vsock-v5-0-2492e141e80b@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, Michal Luczaj <mhal@rbox.co>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luigi Leonardi <leonardi@redhat.com>
X-Mailer: b4 0.14.2

Add three new macros: TRANSPORTS_G2H, TRANSPORTS_H2G and
TRANSPORTS_LOCAL.
They can be used to identify the type of the transport(s) loaded when
using the `get_transports()` function.

Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Luigi Leonardi <leonardi@redhat.com>
---
 tools/testing/vsock/util.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
index 71895192cc02313bf52784e2f77aa3b0c28a0c94..fdd4649fe2d49f57c93c4aa5dfbb37b710c65918 100644
--- a/tools/testing/vsock/util.h
+++ b/tools/testing/vsock/util.h
@@ -33,6 +33,10 @@ static const char * const transport_ksyms[] = {
 static_assert(ARRAY_SIZE(transport_ksyms) == TRANSPORT_NUM);
 static_assert(BITS_PER_TYPE(int) >= TRANSPORT_NUM);
 
+#define TRANSPORTS_G2H   (TRANSPORT_VIRTIO | TRANSPORT_VMCI | TRANSPORT_HYPERV)
+#define TRANSPORTS_H2G   (TRANSPORT_VHOST | TRANSPORT_VMCI)
+#define TRANSPORTS_LOCAL (TRANSPORT_LOOPBACK)
+
 /* Tests can either run as the client or the server */
 enum test_mode {
 	TEST_MODE_UNSET,

-- 
2.50.0


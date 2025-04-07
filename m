Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB76D22172E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744055233; cv=none; b=CUNWoI+2wnp4bX/IH4h8EkH1sO4XYOTiU5gcFGj9smN43SumtoVZvz/jY9HdA/ZOCGy1O/ZgM2nPyAnnNaUWvIZpOiLIWU2iwqDKKCvLXfPZeouU10RNfNJ4gANGn9/4StoQLzkyKOsJ7HydPVlIKr3Dkd8zrC9HrFiyD/yugDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744055233; c=relaxed/simple;
	bh=HYQVkKLDFS6ZhRYZCyfXaaD2XhQID0AqorjlTUWAk7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W7O7Maj1S/i4+y5zNbx0uUu3TEnDMrvG+YIM8E3HK3G7RfOtSQ/tloWrDPJtgv8dvtk8wcme2PZoHY73dLtRO3wY7bUAoTzNhnfXTPvx3XEBkIq8tX8FUwLni78IigwcsSgMiGJ5da+Ai2boHWfnYQlUJt9S1eqvbkwjwJpLgms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=RXzXb6QN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="RXzXb6QN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso32397335e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 12:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1744055230; x=1744660030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOQgBVRGZZnoJaMDdwTp3tH6v0mrDf2JLRZw4IaOnFM=;
        b=RXzXb6QN9EQsV6NaVQC5M969gcs2EkufdBE8eoXnNANX9s3e+V306M0qhORswPxZd5
         UXKel926PWlEa+jh5KAVnZTAOOZh2YbJWD88k3iexmfu0LMY76FTw+FW2SseHgHd3p9k
         zpHdoz0hdmGEmVK5F/O2WHwMOk3vBXJ0pB0tR9BLLtVM/epTIOvYY8rxBYnkcYfJb9LE
         zkbw6u/hY1F3RTSo6+8xxJ6AIzERGU9b/o64yiDjxxlfRfEMz0bMex5HEerUxz+PWfme
         2zwMifCVEgfDY/qiH0s94mOwy6JCuZl6PTSPpIFTJxcP3U7zouYPoGutKSM+H5OF5gfU
         GYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744055230; x=1744660030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOQgBVRGZZnoJaMDdwTp3tH6v0mrDf2JLRZw4IaOnFM=;
        b=u0lWop2GIlbhx6yWliVAv3CI2jVDezHO7Y74GWpsWw+8NbCdKsGxmUd3hLmgvPG563
         0DvbC6r/+8RPsW7OcpA1un/Q5wgCaWxlIcmf0tuU5ks3Ch5TENu5DxwR78Hlm/kEGJgG
         B8FvTJtp0vCCDdOVQZmczjHj1N54Ah7+LRedWrkmdBAkrPnnWkbFQabAlROLbsRcXaRs
         z5mKRFmoZA5DvDPxAWy63AmBibJevlLokkYNkHMf7dHlkuiEzB0NCpSADNBkLBNm54Y8
         H2CndCY8YwHJBNnhviXGymFSY/3fmCbSUtk3fSHlC9IWB/PA/ekyrd9XIZZ5k3R7EevK
         2tTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1chL/kjo+Hby7gbKi751zT3N9Z4Rgp1cxz3VGvRTY49G+9UbVhj8hXEDnUQMGF0WaPCyfGtL2exfUKPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5v6xIjJB77qAhweC/GF6zNyqXAPbBzTXh7gxWPtOSbxovRZLs
	r6q5Re6N8wVaPAcE3lq+2VV/uAKOVPj2EA2K0UNTMUnaty+1EC3sB+N5HNNa6nmk4vsISrcyJZB
	Y+lws/ffYyK8/ePmy91i5cvd5wyHZauXlCbET5LMzogK9zGdJhSiFB3c=
X-Gm-Gg: ASbGncs4w6YEIArKqhecFdQqCNpR4XMbQjH1227Jltdkjg4MFljH3kK9MHmmMk5t90/
	FamEd+g11s8QqsHqc5ExFTqdiJPJZ60O/Gh6ilmAZynvbrxTQtfYIT54Ca3kd8jVJt9WmyJAoG+
	y+7jm26GDP3GuesIl4YFzOw4W58QoYEoLuN++JpTXxHQuf4H2f4k9pelVMbeEL0kk1JDz89fp4d
	iJSXKSTfMnXr3DFLZrzSkdEU5NKHU6EeopWlCJ0soMqTKE1Ojx6IjRaBHqpPhUt7hfI7SgKJMSz
	KWyqBIcq6gPfYsHY729TcwFMSBHa6GXuSB5z5l3KrA==
X-Google-Smtp-Source: AGHT+IH7K/Tlr0afB/YVJjvYVZD1E9BMMpbFJRVzYZ2AJ0Otgp/R+8NHmsxmYmrUdlTrNBZMsz48Uw==
X-Received: by 2002:a05:600c:224c:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43ed382b5d7mr81964505e9.2.1744055229934;
        Mon, 07 Apr 2025 12:47:09 -0700 (PDT)
Received: from [127.0.0.1] ([2001:67c:2fbc:1:fb98:cd95:3ed6:f7c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a3dfsm141433545e9.4.2025.04.07.12.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:47:08 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Mon, 07 Apr 2025 21:46:12 +0200
Subject: [PATCH net-next v25 04/23] ovpn: keep carrier always on for MP
 interfaces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-b4-ovpn-v25-4-a04eae86e016@openvpn.net>
References: <20250407-b4-ovpn-v25-0-a04eae86e016@openvpn.net>
In-Reply-To: <20250407-b4-ovpn-v25-0-a04eae86e016@openvpn.net>
To: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Antonio Quartulli <antonio@openvpn.net>, Shuah Khan <shuah@kernel.org>, 
 sd@queasysnail.net, ryazanov.s.a@gmail.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=HYQVkKLDFS6ZhRYZCyfXaaD2XhQID0AqorjlTUWAk7Y=;
 b=owEBbQGS/pANAwAIAQtw5TqgONWHAcsmYgBn9Cu0FvOEKMZVtzfbyq5bW8/fm9vO3C7TcKS0b
 MiFlermb0yJATMEAAEIAB0WIQSZq9xs+NQS5N5fwPwLcOU6oDjVhwUCZ/QrtAAKCRALcOU6oDjV
 h38pCACCFPtQsZaKwjmUaTeZvKo8tiuE4keb8L9Jphoa3KooqeyiNozOGm5FOB/sfTNtObtuptM
 vC/vNKx5wZ38c7M7BX5BN131buo2nCPrnz8HyOKR5bSITkbRALDGNwMBIMbPr1N4pFLMmAWeeEF
 ElzPaVC/t+vKgDXmfLkcvV5hrfABLYjxRvuTFvXs3s9WsDnjrhPY4ixSyOL0Mk7uCfZkuSx5JRi
 42xHfgJkL+JDzOrUo0TMan4C4rPJE3OCId7umQXNbwN+HOBsYoLgFdYXtjjKKxeZVSwwvMAfaWQ
 wEcAZ9FYr821XXeZWMhVwUYV5qJO8NcFn9GBpW7Atr6/T44/
X-Developer-Key: i=antonio@openvpn.net; a=openpgp;
 fpr=CABDA1282017C267219885C748F0CCB68F59D14C

An ovpn interface configured in MP mode will keep carrier always
on and let the user decide when to bring it administratively up and
down.

This way a MP node (i.e. a server) will keep its interface always
up and running, even when no peer is connected.

Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 drivers/net/ovpn/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ovpn/main.c b/drivers/net/ovpn/main.c
index b19f1406d87d5a1ed45b00133d642b1ad9f4f6f7..15802dfd26fcbcad42c387d42f665b8b47604e8a 100644
--- a/drivers/net/ovpn/main.c
+++ b/drivers/net/ovpn/main.c
@@ -21,7 +21,22 @@
 #include "io.h"
 #include "proto.h"
 
+static int ovpn_net_open(struct net_device *dev)
+{
+	struct ovpn_priv *ovpn = netdev_priv(dev);
+
+	/* carrier for P2P interfaces is switched on and off when
+	 * the peer is added or deleted.
+	 *
+	 * in case of P2MP interfaces we just keep the carrier always on
+	 */
+	if (ovpn->mode == OVPN_MODE_MP)
+		netif_carrier_on(dev);
+	return 0;
+}
+
 static const struct net_device_ops ovpn_netdev_ops = {
+	.ndo_open		= ovpn_net_open,
 	.ndo_start_xmit		= ovpn_net_xmit,
 };
 

-- 
2.49.0


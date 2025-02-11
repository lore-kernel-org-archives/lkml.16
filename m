Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E891E3DD3
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234477; cv=none; b=UpopnUE0GgYRKKdhm/A+OPWEjcsl+psZElB+JgME8VPyQc2y+27YG0wvqioucNawrA5TmTChhbOZ32cUePtl3Id23CAOF9b7jegpje5juup4nGeOosA7XWL1EdBmWejpeMOUPbglqsn/NcYrHs4WkufETUHnlB+ZYAIHyHANjmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234477; c=relaxed/simple;
	bh=G9MvzYO3Ny58MIPU3gEDrP/93Du1klO3eFnBz3MwfEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrfSh8fSnEnykeIc8KPRcfMhJeKijs/aawFOpTOePwvEFf48QYj1fI3vRgGXFTni4CLx898ZM+EJ9USO8sybrn8CB9Ir8qb89ui3PBnrYJjF4p380vEEnnp2eu7W98RHDThYib/wxJ+LGtwyNN9Qr2cTBZ2Sh9ztFoUkvGDc/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=gzV3Z2v+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="gzV3Z2v+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso32932465e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1739234474; x=1739839274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrEXm5KUMO8bu4cOPykFFzU59kwJuQPspTdEoef+/X0=;
        b=gzV3Z2v+WZr3Dud6431AVCgDALaayJywERoQxV2IfPCzcRj01Che54hPvE0bl+4330
         XFPBLfW7fN8jXaTW0tohbcF6mubL9JF9YQ1l/EIIBFopvStdFL9LnW2y3XdYFlsxIlkZ
         794TwiBaOj9XbyTe/1TZ6qksUjtPGqZ69KmOWtqfzlT8prBkcvJX239UaAx6pHq8ZgGo
         gdS6arf09lqY/OOZ4umGHjRrAZaLGJz7eNFTRaRI/FUW+iUKJSBHEvj5UYppr0shdepF
         x358Qfx0UVeUI6CDs8VRPQreBoHEa4Ee6r8a+obzSBSQNLdl6EXTHY243gIuaaVZRkRi
         wo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234474; x=1739839274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrEXm5KUMO8bu4cOPykFFzU59kwJuQPspTdEoef+/X0=;
        b=kD5+abeQ44un47vcC7HiADe4jusPgLaTosJMLl4M+oYEjKo2cq/KfNx9ePxLOGKvad
         RCe1Wd6WYT7bTEDMwdGQ0RPWTUzl6r6eomgu+Y0ziSHvG8sNCsmcbNLyScOgMqi6RonB
         277uYBKpko2AF282/r12O0j7N9+RzarSurBNWbe1E0X/f+8sdMpPAEMmsWlLqnfQ/SIm
         lHAiy9hCfXIJaMHThB/St9zGYERSwqV2k/EJkpgHN2A+cB3FntAJo5E/5v5/FJKO6/ZZ
         s6w4LtMRgdo87DTTVDG05vKK94uGf3rSlBZL0/7bNMud6rb8esgth712pGBPebu8dPH9
         ZMEA==
X-Forwarded-Encrypted: i=1; AJvYcCXYE4EIReZ2MvETEQhbqQKdHFjJGGkspfgR28i8sha4X5RMiHXtbVlCPDKAdHJeexB2gU8754rT0y1Tzco=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAiaydQoz9CAoVYMCxQRjeoBvTNfu0AA1/azX+TRShyz9mQj8q
	fgpJHdgJOPRo4p03Ul35RoFBGuTWFUW7EBZevXGom4ASk/DlGUC5MOeNd6HRMes=
X-Gm-Gg: ASbGncuHZIwYolmF1hGb6XuTQhNijOA6OU8cLJS8a3rEZxpHYESLoLTi3XTJScpta8u
	4c+iJnjQGL5MDkjJHpDdoEHdo/ncqDXR3M9V8DAeoMRGMb/MvYc0zEsRdG/vo3D1360DtcnApRU
	/c/Zi2gMc8bqZhkdUd334QL4D05q6WaLz67ywDwK/w0nEDWT2wI7QdPLXoWNYJMf/5eQJPdKw9y
	lb6E1MhhNg/aKzm1LAS8HXG6vP5US2jSk23fUZjXfYrYAYtBRirYmyp747eDW3gZ5acc+1gmJUM
	/+4QnYPJ+nKn4admBa6KhXZTOHY=
X-Google-Smtp-Source: AGHT+IFEvAQ8oU6tPW2P71IYr9BPXZM34giANi4cHxhLRkH+SXRfnHxvZH9cCQFtUS7HlHjYaBlPFQ==
X-Received: by 2002:a5d:64e3:0:b0:38d:d4b5:84cf with SMTP id ffacd0b85a97d-38dd4b58773mr8481281f8f.5.1739234474070;
        Mon, 10 Feb 2025 16:41:14 -0800 (PST)
Received: from serenity.mandelbit.com ([2001:67c:2fbc:1:1255:949f:f81c:4f95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394dc1bed2sm3388435e9.0.2025.02.10.16.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:41:13 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Tue, 11 Feb 2025 01:40:04 +0100
Subject: [PATCH net-next v19 11/26] ipv6: export inet6_stream_ops via
 EXPORT_SYMBOL_GPL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-b4-ovpn-v19-11-86d5daf2a47a@openvpn.net>
References: <20250211-b4-ovpn-v19-0-86d5daf2a47a@openvpn.net>
In-Reply-To: <20250211-b4-ovpn-v19-0-86d5daf2a47a@openvpn.net>
To: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Antonio Quartulli <antonio@openvpn.net>, Shuah Khan <shuah@kernel.org>, 
 sd@queasysnail.net, ryazanov.s.a@gmail.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>, 
 David Ahern <dsahern@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=G9MvzYO3Ny58MIPU3gEDrP/93Du1klO3eFnBz3MwfEM=;
 b=owEBbQGS/pANAwAIAQtw5TqgONWHAcsmYgBnqpyNNNEbasLJHjbQQKAHJzCvFMV3DdV899psE
 U+bNXJ4a/yJATMEAAEIAB0WIQSZq9xs+NQS5N5fwPwLcOU6oDjVhwUCZ6qcjQAKCRALcOU6oDjV
 h7UXB/4v3kLDFmgBy1T2UzT9VU26GS9qnrxnH3kBUKbjLy4XTftVVXVQ9zB42hxUAZBzaGLMN1X
 pFrZIR86b9cujt5p2ZhoBKmOz0bBGFJbeQcoX/rk+IqA03D/naZpqG0NNhfRkGpr7ojC3hOFRml
 ErBXzD0BbEB7SX+/DUlCpIjaF8G5Vj2faDZ3vyREMEOld+hMCE/Zimhet/CfocXoMFbTjGdInBk
 XGipqycn7IZr5dEVjNPz1SA1WzdYU/VRpnGCkfyvJDoexGgTJCPHfN1qD1Ma56RJIZyjAVlYfbf
 eaw109OFmpM7IGIDqLM0DxyPLjFGCSR9LOXFOWV5je9uWGSb
X-Developer-Key: i=antonio@openvpn.net; a=openpgp;
 fpr=CABDA1282017C267219885C748F0CCB68F59D14C

inet6_stream_ops is currently non-static and also declared in
include/net/ipv6.h, however, it is not exported for usage in
non-builtin modules.

Export inet6_stream_ops via EXPORT_SYMBOL_GPL in order to make
it available to non-builtin modules.

Cc: David Ahern <dsahern@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 net/ipv6/af_inet6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index f60ec8b0f8ea40b2d635d802a3bc4f9b9d844417..3e812187e125cec7deac88413b85a35dd5b22a2d 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -715,6 +715,7 @@ const struct proto_ops inet6_stream_ops = {
 #endif
 	.set_rcvlowat	   = tcp_set_rcvlowat,
 };
+EXPORT_SYMBOL_GPL(inet6_stream_ops);
 
 const struct proto_ops inet6_dgram_ops = {
 	.family		   = PF_INET6,

-- 
2.45.3


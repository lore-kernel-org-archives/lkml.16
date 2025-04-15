Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2962BCF58
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715881; cv=none; b=eyqMLNvlkpnXcni6MYGt7Mgi9acIAfWFM+hwMvVFHl7Xm34f3aAk/cz+/ITAr46o3K4ZuEEgpWRCaJDyIE2ejt4qdzRsbdrH9iDnV+BfROvI2oMOkPst962KcZBBsFr7xA1yY7cJBxrdq+ExxK+ohuJZaf8i7nG1cdDbXGYMPFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715881; c=relaxed/simple;
	bh=+m3tlswA/C58CSW303WbNzD55RlTq5TdK2GIiXBLu2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cah2zKW6MYjRwgdFz5TBEF8wDuFa/zEL1R1qJpAtYdGN+NeQlmFn0NNaQLDouGvGGIoQsSktfph/wr6yQ5oeC7mZdLurhwPw0FqPqXumlPA6fhYGQdcxlwcyFAW80kbV8Wm2eybQOaU6T42LjW2xLMk43zc9Y4sKdHuUvglav2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=CCYm+HvM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="CCYm+HvM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf848528aso45054505e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1744715875; x=1745320675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDo4E58Z4GiyjgViKH7H1rsh8W7CNiDIluEBrKsBDtU=;
        b=CCYm+HvMTAFEbZD51Zuy9Z8v7PsY6iOdytPQBwYBzs804TOwkFytb6IWdTLd+D/cc5
         vKKbUVH0mM15D8ELgKs3VTa1zAT/ezaJ8ViXrJYADcO/J3KnDV8ipnxTSCdtBuKVvX/+
         /CAEmosPXaIGcWwfMdHEtTiqKd0Q2y3n2N8xNxXYBqpnIcy563sxKnKCqgnnfvwwFFAz
         JDRZMgzNX/pFBqNprt85FqSTnfklWoTd/xTZ1l02IIsAylRsbqdNrK0T/tTj9fpmPW0y
         5vOnoDYC8JGjMBFhTceazynYUeZabHeJi7eKjlh8GXGSOOSb4VMfGdMq8pYWFdgc/NkN
         H7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715875; x=1745320675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDo4E58Z4GiyjgViKH7H1rsh8W7CNiDIluEBrKsBDtU=;
        b=RqYgVLXrPgOgDAfXkvtJd9n59DVmQPQkdeyvJorGSFkjY9BOqQWw03+oV8o0+4Vs/9
         iLpu/bhe0OJgYPFxie6ETC19LUc6EnHR8H+nz957gWrdTjCXbBGK4MEuFasr2QOuO4iD
         pXDWwffk4fH+n+avsucpLLYyfNufG3AJQSA5+5hi8LA2yBDJTVbcvkfFCLxlRVe+spIP
         BLPWU7BduhHixq9pz48GhExWttaWbHV5qKRai4q4hcYRtf8JbwXrfj/ZyUR3sA+lmHyj
         BQTEGox7KScI+nDBSNsoZ3Dq9jS2ZjwpPyhJJkcXiEZQWto+2+OCJZBz7+XDpZRCoAGQ
         sbOg==
X-Forwarded-Encrypted: i=1; AJvYcCWaLuMzltFa2F9CnCkINH29WjyXWD2FGSCRsHvTsohIP1fth2FhabChVqqAgV+BUI6gUDiBlpxZOiQVAaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSCx2YoDzrbzMjgTLSUeocBbpQ9FiQ4jIGULSlnuDCQ/L/M4RQ
	plvlnMwN7xd9KVtPxkq0eDqOGfzItvuWYyxQCsKWmWXl5/+BOsIuava2Vl8BScsW8+T7ycOKDWK
	Kl9On6h7OSqJ2sV68LpjP/OyCx4E2VzUSFLGuwSRSTQ0j0XS0eiMftgw=
X-Gm-Gg: ASbGnctBgWeILyd0FRgQd37/Y1UKkP5a2ZljO2d4ACpJ/MLltHz9oBYdxvBP2MTw9r0
	mMI+cNNZixGncHdfn78ikbYcr/2TEMlod+DQKkq2ixrATtmiCxekyQNFQst/8DEvtP4qt/M8/7y
	hTbW+uaYGYb5YvEtrxPkU4SZBbUioZpEu1eJ5dRq+qopwAxxi8BPerUTuDYmWqr0U1fSakty40S
	DiZ8D5u8L6hfAu3mWwbBMEoEnH7nq8ZQqV7kl6mtfX+bseTbESV/J0pc8IR4mWgxGKmcvoiJsAZ
	8O1qJ3Gbxo4DN7qUH1Mqw40FMIG9CB6ETTqt+g==
X-Google-Smtp-Source: AGHT+IEFxLDPrCvz+qbpmpr2fHmj5St/mAmYl3ctWBeGLo/g0haXN6SiP/ICM1A8PSpby+n1t8YiXg==
X-Received: by 2002:a05:600c:3483:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-43f3a93c7c7mr153344635e9.9.1744715875528;
        Tue, 15 Apr 2025 04:17:55 -0700 (PDT)
Received: from [127.0.0.1] ([2001:67c:2fbc:1:83ac:73b4:720f:dc99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d26bsm210836255e9.22.2025.04.15.04.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:17:55 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Tue, 15 Apr 2025 13:17:39 +0200
Subject: [PATCH net-next v26 22/23] ovpn: add basic ethtool support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-b4-ovpn-v26-22-577f6097b964@openvpn.net>
References: <20250415-b4-ovpn-v26-0-577f6097b964@openvpn.net>
In-Reply-To: <20250415-b4-ovpn-v26-0-577f6097b964@openvpn.net>
To: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Antonio Quartulli <antonio@openvpn.net>, Shuah Khan <shuah@kernel.org>, 
 sd@queasysnail.net, ryazanov.s.a@gmail.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=+m3tlswA/C58CSW303WbNzD55RlTq5TdK2GIiXBLu2s=;
 b=owEBbQGS/pANAwAIAQtw5TqgONWHAcsmYgBn/kBCJAXJ5ieI9UdG7ZdBzCyyuDy+NnVdZLyz1
 zyACUGimESJATMEAAEIAB0WIQSZq9xs+NQS5N5fwPwLcOU6oDjVhwUCZ/5AQgAKCRALcOU6oDjV
 h5jlB/4h54npijhaPkX4d3rH9jsOt18HydP/dplr6UDnxyMs6R9XhkvR8bgYIywNJVCV4VJSNrj
 BAnwm2DWMmUsCM74MKo5/S18nmKpfTkzmInqqPmDp6IOVy8JkzYMYsDxdueu2S7ivLNug3fqkwV
 uRJaoUoRTXz1cqOdL4EMVvqpJd8tAD7YPIurmewpnw8BWVrt7BCr5/Xtd+WWNS//6OALl/sMHMS
 xiUtoZXrQ9yhS4AQXHqI3Ie8BxXCFup9qSCWs2ranIcJbbMZ3OSt198DgjDELg25HAoqx+YMpg8
 e/CuCa5MGagvmrJaY3ymRqLh7gMTZT5rSSvF8lsJ689JRs8+
X-Developer-Key: i=antonio@openvpn.net; a=openpgp;
 fpr=CABDA1282017C267219885C748F0CCB68F59D14C

Implement support for basic ethtool functionality.

Note that ovpn is a virtual device driver, therefore
various ethtool APIs are just not meaningful and thus
not implemented.

Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ovpn/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ovpn/main.c b/drivers/net/ovpn/main.c
index 232eeb08e929230afca909bca539ef97892837f5..0acb0934c1bea49c2277aeebefe68dde660f2042 100644
--- a/drivers/net/ovpn/main.c
+++ b/drivers/net/ovpn/main.c
@@ -7,6 +7,7 @@
  *		James Yonan <james@openvpn.net>
  */
 
+#include <linux/ethtool.h>
 #include <linux/genetlink.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
@@ -120,6 +121,19 @@ bool ovpn_dev_is_valid(const struct net_device *dev)
 	return dev->netdev_ops == &ovpn_netdev_ops;
 }
 
+static void ovpn_get_drvinfo(struct net_device *dev,
+			     struct ethtool_drvinfo *info)
+{
+	strscpy(info->driver, "ovpn", sizeof(info->driver));
+	strscpy(info->bus_info, "ovpn", sizeof(info->bus_info));
+}
+
+static const struct ethtool_ops ovpn_ethtool_ops = {
+	.get_drvinfo		= ovpn_get_drvinfo,
+	.get_link		= ethtool_op_get_link,
+	.get_ts_info		= ethtool_op_get_ts_info,
+};
+
 static void ovpn_setup(struct net_device *dev)
 {
 	netdev_features_t feat = NETIF_F_SG | NETIF_F_GSO |
@@ -129,6 +143,7 @@ static void ovpn_setup(struct net_device *dev)
 
 	dev->pcpu_stat_type = NETDEV_PCPU_STAT_DSTATS;
 
+	dev->ethtool_ops = &ovpn_ethtool_ops;
 	dev->netdev_ops = &ovpn_netdev_ops;
 
 	dev->priv_destructor = ovpn_priv_free;

-- 
2.49.0


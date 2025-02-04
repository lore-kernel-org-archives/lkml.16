Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com [209.85.128.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C133021ADC3
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738705313; cv=none; b=WX+J3DKgZwBaoUMMcGyApE/KdGNo8QwRXgeQwxIvDZIUGNQcXpdN+zynZccdzo5yogZakmHsFAKXqcurcrWdB1ZiSkpiMXxOIf2/4QOQUncAnGnBJqRAkqyGlqS+vAaftOUm3v514VDr7B1b7C6nbRy0zmbSV1dpoNWTgxOpUnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738705313; c=relaxed/simple;
	bh=sSzdqym4sZoyr/rmSa6l3jQQ+kw4oamO6hBvh4Cn/NU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B85MmlTb9WH5LESLcpLAX7nNZg3XEyWPwTfZhPqdMvvbPCiFnnFNpAZk4il1JR3aBxBFGr2u3J50QE4vUZKV0fFJJDXcpIoiRjnSRITil8y4o4malpmlG85CYdWo25EFvna4tf2JHcz99FCvCdyjd41Ra0RxyK9Ac20lGWvMq5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Ck+vYQ8v; arc=none smtp.client-ip=209.85.128.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Ck+vYQ8v"
Received: by mail-wm1-f99.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso42546465e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 13:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1738705308; x=1739310108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PV9AUvrwCJA5VPnpgRlNS/C2+Teqvu1ALhuWovCyEH0=;
        b=Ck+vYQ8vqzlVx5bQvsjfjBMfmbNtP9MgbsIMpAzCwfaVm5001ZUQ6LlzRmMLghuWOe
         aP5YDm01ZzVb5GsogFxEXOsE+SZyTHKzlWcQQHirexG9TvBjC7UNFuvDVF5BoCkqYZre
         XZyBHitKLTWkUMKJO3jLXsQavWIn0iLs6x+Mei7DHWVUovzb4GlJdDWcOVbkF9eoZjP3
         7ox/uwXCoJ0WXH0JRaczaN9RZSj8ULvL0RBBDJCSmf+oAnQGqtZynpmTrQL6okdkg09A
         5xK0G/ugFGHDqBk4MOqMzcwD6xwXr/iXIO9DFMTwlXp1YSC7nRHVZDiWvw5mn0+zhEeK
         5+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738705308; x=1739310108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PV9AUvrwCJA5VPnpgRlNS/C2+Teqvu1ALhuWovCyEH0=;
        b=AtQJh6E0cQW9Qeww2B54Q5OCyIxHIHspuk45cl4aJsAycAbdeRSt0gHMqDYX3QPgC4
         WPGXyKxrZLG5oTrpoRnCzzBAfvrM9s1raa+5eSq1f7UQ7GVDTnSGbJEdIJl/C+7SUHgX
         sTYgGF4C9fLW34z+N9UFf36yocCpL40ID56GdFrl5UK+jSGMHSiWUCmSPICKVo4L9awT
         d+ehppnCms61eSp+NmkD2CVJ3D4A9uBd/h40TMITQE6WUi6sNUz9IW40z/X2Tabu4s++
         J8d5TYYaFWNl9bVdzk1Hx6udOIWB/Y1XzreuJO/BRysNsLiNarCFj9GR9KBLSInYRiQf
         KpsA==
X-Forwarded-Encrypted: i=1; AJvYcCUDNDkKw0rW5zio4ymALewzu5PvG7fgm6htqoc0ZqKYMd381Dh57E2RAxa97sqGV7/G7BgPSp64RNr2zPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz9NsgYd2kF3NSFatFvDQu+hfkbp8t6shMV7woDp+accHxM/2v
	2jnP1A7qhbT6XnELvBkuyhqaMgVz1hub6nfkdcQP2ITgxutVOINVgb7CL9n/MS2xpk4HVBgX+lh
	Mcp99TyVcC32fxnl2Cc3/Rffi9boSUfxTQaorI8T60YBKuPIf
X-Gm-Gg: ASbGncuWfE3ucpgPriljqxJ1Ra7g1enyt5Cxt+cXAqrEUcZQd3usUzDNpFlonUt3Y+k
	4Vbq8+lPVjFOC/oD97pzlpb1utUcRkzXwBDWm9ssHu/nKoZ1LFGzF7b2FiZu+9RZ6lr/9gi1wJP
	BQRtGsvYTIevyijdipnN6pUIx0qIxxzJ+bjcgWMwWGSW0OopN09Y4YLV2VsngaIeFzND/6uJY++
	PfOJAmq3t4DogumpY68+0a/W/YxB7ecG1FYTwD8oa7vce0c4UsqHUVECvhXfiJ6xNwyLIoNXEsL
	jeOFKQexFpDFbf8ivgyuetye
X-Google-Smtp-Source: AGHT+IGhaewQbBaoTXZSAKHFJMCAhFK//sDV5ZUHJPRJ+3ng+fuv7wgumD/wxj76xopWMCJVj/2/utmFFcoA
X-Received: by 2002:a05:600c:3150:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-4390d435ed6mr1660995e9.12.1738705307682;
        Tue, 04 Feb 2025 13:41:47 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4390da738c0sm30715e9.29.2025.02.04.13.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 13:41:47 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 2A099340807;
	Tue,  4 Feb 2025 14:41:46 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 0937FE55E5B; Tue,  4 Feb 2025 14:41:46 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Date: Tue, 04 Feb 2025 14:41:45 -0700
Subject: [PATCH v2 2/2] netconsole: allow selection of egress interface via
 MAC address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-netconsole-v2-2-5ef5eb5f6056@purestorage.com>
References: <20250204-netconsole-v2-0-5ef5eb5f6056@purestorage.com>
In-Reply-To: <20250204-netconsole-v2-0-5ef5eb5f6056@purestorage.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Currently, netconsole has two methods of configuration - module
parameter and configfs. The former interface allows for netconsole
activation earlier during boot (by specifying the module parameter on
the kernel command line), so it is preferred for debugging issues which
arise before userspace is up/the configfs interface can be used. The
module parameter syntax requires specifying the egress interface name.
This requirement makes it hard to use for a couple reasons:
- The egress interface name can be hard or impossible to predict. For
  example, installing a new network card in a system can change the
  interface names assigned by the kernel.
- When constructing the module parameter, one may have trouble
  determining the original (kernel-assigned) name of the interface
  (which is the name that should be given to netconsole) if some stable
  interface naming scheme is in effect. A human can usually look at
  kernel logs to determine the original name, but this is very painful
  if automation is constructing the parameter.

For these reasons, allow selection of the egress interface via MAC
address when configuring netconsole using the module parameter. Update
the netconsole documentation with an example of the new syntax.
Selection of egress interface by MAC address via configfs is far less
interesting (since when this interface can be used, one should be able
to easily convert between MAC address and interface name), so it is left
unimplemented.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 Documentation/networking/netconsole.rst |  6 +++-
 include/linux/netpoll.h                 |  6 ++++
 net/core/netpoll.c                      | 51 +++++++++++++++++++++++++--------
 3 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index 94c4680fdf3e7e1a0020d11b44547acfd68072a5..90a1bbb52918a0163828f4e96c89781e0bc6856b 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -45,7 +45,7 @@ following format::
 	r             if present, prepend kernel version (release) to the message
 	src-port      source for UDP packets (defaults to 6665)
 	src-ip        source IP to use (interface address)
-	dev           network interface (eth0)
+	dev           network interface name (eth0) or MAC address
 	tgt-port      port for logging agent (6666)
 	tgt-ip        IP address for logging agent
 	tgt-macaddr   ethernet MAC address for logging agent (broadcast)
@@ -62,6 +62,10 @@ or using IPv6::
 
  insmod netconsole netconsole=@/,@fd00:1:2:3::1/
 
+or using a MAC address to select the egress interface::
+
+   linux netconsole=4444@10.0.0.1/22:33:44:55:66:77,9353@10.0.0.2/12:34:56:78:9a:bc
+
 It also supports logging to multiple remote agents by specifying
 parameters for the multiple agents separated by semicolons and the
 complete string enclosed in "quotes", thusly::
diff --git a/include/linux/netpoll.h b/include/linux/netpoll.h
index f91e50a76efd4b016381c632456397eea1ea877f..1ade65b59be49cfdcf86ed6e938287b949aa9f58 100644
--- a/include/linux/netpoll.h
+++ b/include/linux/netpoll.h
@@ -25,7 +25,13 @@ union inet_addr {
 struct netpoll {
 	struct net_device *dev;
 	netdevice_tracker dev_tracker;
+	/*
+	 * Either dev_name or dev_mac can be used to specify the local
+	 * interface - dev_name is used if it is a nonempty string, else
+	 * dev_mac is used.
+	 */
 	char dev_name[IFNAMSIZ];
+	u8 dev_mac[ETH_ALEN];
 	const char *name;
 
 	union inet_addr local_ip, remote_ip;
diff --git a/net/core/netpoll.c b/net/core/netpoll.c
index 62b4041aae1ae8c7dc47c89fb40b14bbd4ad0e0e..c4b329fa874748eddff64bbba13902893faebbce 100644
--- a/net/core/netpoll.c
+++ b/net/core/netpoll.c
@@ -501,7 +501,8 @@ void netpoll_print_options(struct netpoll *np)
 		np_info(np, "local IPv6 address %pI6c\n", &np->local_ip.in6);
 	else
 		np_info(np, "local IPv4 address %pI4\n", &np->local_ip.ip);
-	np_info(np, "interface '%s'\n", np->dev_name);
+	np_info(np, "interface name '%s'\n", np->dev_name);
+	np_info(np, "local ethernet address '%pM'\n", np->dev_mac);
 	np_info(np, "remote port %d\n", np->remote_port);
 	if (np->ipv6)
 		np_info(np, "remote IPv6 address %pI6c\n", &np->remote_ip.in6);
@@ -570,11 +571,18 @@ int netpoll_parse_options(struct netpoll *np, char *opt)
 	cur++;
 
 	if (*cur != ',') {
-		/* parse out dev name */
+		/* parse out dev_name or dev_mac */
 		if ((delim = strchr(cur, ',')) == NULL)
 			goto parse_failed;
 		*delim = 0;
-		strscpy(np->dev_name, cur, sizeof(np->dev_name));
+
+		np->dev_name[0] = '\0';
+		eth_broadcast_addr(np->dev_mac);
+		if (!strchr(cur, ':'))
+			strscpy(np->dev_name, cur, sizeof(np->dev_name));
+		else if (!mac_pton(cur, np->dev_mac))
+			goto parse_failed;
+
 		cur = delim;
 	}
 	cur++;
@@ -679,27 +687,45 @@ int __netpoll_setup(struct netpoll *np, struct net_device *ndev)
 }
 EXPORT_SYMBOL_GPL(__netpoll_setup);
 
+/*
+ * Returns a pointer to a string representation of the identifier used
+ * to select the egress interface for the given netpoll instance. buf
+ * must be a buffer of length at least MAC_ADDR_LEN + 1.
+ */
+static char *egress_dev(struct netpoll *np, char *buf)
+{
+	if (np->dev_name[0])
+		return np->dev_name;
+
+	snprintf(buf, MAC_ADDR_LEN, "%pM", np->dev_mac);
+	return buf;
+}
+
 int netpoll_setup(struct netpoll *np)
 {
+	struct net *net = current->nsproxy->net_ns;
 	struct net_device *ndev = NULL;
 	bool ip_overwritten = false;
+	char buf[MAC_ADDR_LEN + 1];
 	struct in_device *in_dev;
 	int err;
 
 	rtnl_lock();
-	if (np->dev_name[0]) {
-		struct net *net = current->nsproxy->net_ns;
+	if (np->dev_name[0])
 		ndev = __dev_get_by_name(net, np->dev_name);
-	}
+	else if (is_valid_ether_addr(np->dev_mac))
+		ndev = dev_getbyhwaddr_rcu(net, ARPHRD_ETHER, np->dev_mac);
+
 	if (!ndev) {
-		np_err(np, "%s doesn't exist, aborting\n", np->dev_name);
+		np_err(np, "%s doesn't exist, aborting\n", egress_dev(np, buf));
 		err = -ENODEV;
 		goto unlock;
 	}
 	netdev_hold(ndev, &np->dev_tracker, GFP_KERNEL);
 
 	if (netdev_master_upper_dev_get(ndev)) {
-		np_err(np, "%s is a slave device, aborting\n", np->dev_name);
+		np_err(np, "%s is a slave device, aborting\n",
+		       egress_dev(np, buf));
 		err = -EBUSY;
 		goto put;
 	}
@@ -707,7 +733,8 @@ int netpoll_setup(struct netpoll *np)
 	if (!netif_running(ndev)) {
 		unsigned long atmost;
 
-		np_info(np, "device %s not up yet, forcing it\n", np->dev_name);
+		np_info(np, "device %s not up yet, forcing it\n",
+			egress_dev(np, buf));
 
 		err = dev_open(ndev, NULL);
 
@@ -741,7 +768,7 @@ int netpoll_setup(struct netpoll *np)
 			if (!ifa) {
 put_noaddr:
 				np_err(np, "no IP address for %s, aborting\n",
-				       np->dev_name);
+				       egress_dev(np, buf));
 				err = -EDESTADDRREQ;
 				goto put;
 			}
@@ -772,13 +799,13 @@ int netpoll_setup(struct netpoll *np)
 			}
 			if (err) {
 				np_err(np, "no IPv6 address for %s, aborting\n",
-				       np->dev_name);
+				       egress_dev(np, buf));
 				goto put;
 			} else
 				np_info(np, "local IPv6 %pI6c\n", &np->local_ip.in6);
 #else
 			np_err(np, "IPv6 is not supported %s, aborting\n",
-			       np->dev_name);
+			       egress_dev(np, buf));
 			err = -EINVAL;
 			goto put;
 #endif

-- 
2.34.1


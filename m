Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC811898FB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744883974; cv=none; b=ht/nZjcAcw3oqfaih2KnWhNeIAWlmMonCzoG3rmDcD73tUkxvGnwt+Y+PMQzBvy2VKJ/Lhv4JsvDdpoBDDw9mg2L25Di/DYrr2P/i71eTD7OSjdhSD3n9NvTydetzrmnJ81rGj/rdu5jEabdb9gY5L/jAj85+Y0w16KtN2Lzj1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744883974; c=relaxed/simple;
	bh=dfaKIA+ZyeYf8jgpIzJiuamXxWjTumeUCcyI01/yp3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoaNs0HWFX/Z5OhRlPrgZQhs1LWs3A5SA9FtUDZMjAZko6J8Zs34/F1zBm51VPxsQ5wbyalWUWl7jdgHs98kuiGryKmovLqxAXZ5u2c5st0yp5Y2qBdQ9JGWUs6ANY0PeHQgC7dru3Zi004h/o+dlFPSQ8EsL5BVINIY+WYKBXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=HyhB1sDE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="HyhB1sDE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso5018775e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1744883971; x=1745488771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=glMFihfGC+1JyTwFt+Mu0ExdnvDPdZFZwlen3T2Owjw=;
        b=HyhB1sDEgcmjOlOHB1P5iHEqOMcujpeIHnmLjn0FWuAe7Bbptj/BchVTOirHidOEha
         wgGyyJhJDKgaWMT68QqdYCHbFaqrLS2haNKl7Oh4wIVe4HiOxhPy0Zbe+CUqJvP2kil7
         zNaBahOlgTY/YSdScaAauycmtK85ZRJI5KM1Y3jjVUPRMiaalE+rQGa4afwNH8c6wBjO
         LD5SJgICD4F31L4Y69ILXJp/8oHWZy9OG6dcK9xlS6uZFMhmySjNA9NrwNA/jmjhEwuM
         0DXsTq00p+JG0cSFepOgo5MryvYTYYda36syH/9/+WctbdRKJWDVAIoxg+VVO4n8dfli
         q3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883971; x=1745488771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glMFihfGC+1JyTwFt+Mu0ExdnvDPdZFZwlen3T2Owjw=;
        b=DKqZwUcwi8x2DDy5cWl8OMC6dkAWfX3eEyh7N+Y0foC1qmY0sayqkenIKwX2+NeteS
         BLBQmW5OOtnsJ3xtworZYojq1zrNa+9Syb1u8h2D+H6eJQduvxHk2In7+gTo/8SXgEJw
         9bmRrBT5i3imo9SS5s2FYM6T9cUPnvVnEGltJjBtqUbzbmmGSSmD4rwrg9uvvmBIZYLT
         4a68SrLYddAUA7HzXbD9n2qRvvo72ERmP7cWWsukMqFeOj0Mf68og2o9i97glPOhMA3+
         r7EGntoj6j7wgNwb35QDklQdoi/JEOp4F59u76evG2ywZ5pePexuTRB5RXRw3mQNbWGf
         ZKFg==
X-Forwarded-Encrypted: i=1; AJvYcCWxT8/YEwza9wjHQPHqXp/TyBJz0/qdw8hmXes0afEpD2SmHi8Vmi/m2scd0CrYZijZwQcBgOS5x1Eqd0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/KJSvD8Vyvh0+t08ROZyScInHM7LtS9/OUfGd+OD9LcTC9+vO
	mTwCvfojZuui/fMSKxrzQ11JIWb7+UByLAOIGuu3xqLLcbUvVXAT5JobS2yOKHY=
X-Gm-Gg: ASbGncuo1mEOUYaNPYwn0DozMDBOfL11dUT1yDUQK6dvP2Rojxz9bZDt8Ha9MfuEAqp
	5hVU9J8Qy33OrtYn69VBqj1/8gOzjcaNf7qdCJahyMwPedxu2i3PilSdjzUkdG/TqR0ji2oge/C
	MU7Qo2QzMZ8B93fx98dyDxKUchq7emOKKBdRRzEYKPkkZ0MZOdTEb+2opBTJ1z58YDy3GH/Fou+
	cystlfun9RWi2E3DIYNZ5RGegGl6bnfdC45noxjb5uCgO4UED2+/duwx+dnyqtOXr0ON9tjFwtL
	qvUpLnVSv8FelgcIS6P93lyhm0BwLUU9wX2Mgds4Or9/rVpk
X-Google-Smtp-Source: AGHT+IE3fUywynuHYSYOtj1852EpIi6J5HPvBsrMHhDQq7lQ8vg3DUWM86whi2+QZP/4BiiULL8bGg==
X-Received: by 2002:a05:600c:a15:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-4405d61ce41mr54767445e9.9.1744883971030;
        Thu, 17 Apr 2025 02:59:31 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8216sm48011265e9.7.2025.04.17.02.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 02:59:30 -0700 (PDT)
Date: Thu, 17 Apr 2025 11:59:20 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc: "donald.hunter@gmail.com" <donald.hunter@gmail.com>, 
	"kuba@kernel.org" <kuba@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, 
	"Dumazet, Eric" <edumazet@google.com>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"horms@kernel.org" <horms@kernel.org>, "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>, 
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>, 
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "saeedm@nvidia.com" <saeedm@nvidia.com>, 
	"leon@kernel.org" <leon@kernel.org>, "tariqt@nvidia.com" <tariqt@nvidia.com>, 
	"jonathan.lemon@gmail.com" <jonathan.lemon@gmail.com>, "richardcochran@gmail.com" <richardcochran@gmail.com>, 
	"Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>, "Olech, Milena" <milena.olech@intel.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: [PATCH net-next v2 3/4] dpll: features_get/set callbacks
Message-ID: <y5d6hkhdgwprncbnfmznuk5otluqz3vqi6fof6cyr4dc673cqx@5kr6ys6g53ev>
References: <20250415181543.1072342-1-arkadiusz.kubalewski@intel.com>
 <20250415181543.1072342-4-arkadiusz.kubalewski@intel.com>
 <lljouuqzmhcb2esfrxrviohrwgweee6632ntfoca5fqho736il@auarfibpahpf>
 <SJ2PR11MB84521AE1C30176E2A31C4F709BBC2@SJ2PR11MB8452.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB84521AE1C30176E2A31C4F709BBC2@SJ2PR11MB8452.namprd11.prod.outlook.com>

Thu, Apr 17, 2025 at 11:23:09AM +0200, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Wednesday, April 16, 2025 2:11 PM
>>
>>Tue, Apr 15, 2025 at 08:15:42PM +0200, arkadiusz.kubalewski@intel.com
>>wrote:
>>>Add new callback ops for a dpll device.
>>>- features_get(..) - to obtain currently configured features from dpll
>>>  device,
>>>- feature_set(..) - to allow dpll device features configuration.
>>>Provide features attribute and allow control over it to the users if
>>>device driver implements callbacks.
>>>
>>>Reviewed-by: Milena Olech <milena.olech@intel.com>
>>>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>>---
>>>v2:
>>>- adapt changes and align wiht new dpll_device_info struct
>>>---
>>> drivers/dpll/dpll_netlink.c | 79 ++++++++++++++++++++++++++++++++++++-
>>> include/linux/dpll.h        |  5 +++
>>> 2 files changed, 82 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
>>>index 2de9ec08d551..acfdd87fcffe 100644
>>>--- a/drivers/dpll/dpll_netlink.c
>>>+++ b/drivers/dpll/dpll_netlink.c
>>>@@ -126,6 +126,25 @@ dpll_msg_add_mode_supported(struct sk_buff *msg,
>>>struct dpll_device *dpll,
>>> 	return 0;
>>> }
>>>
>>>+static int
>>>+dpll_msg_add_features(struct sk_buff *msg, struct dpll_device *dpll,
>>>+		      struct netlink_ext_ack *extack)
>>>+{
>>>+	const struct dpll_device_ops *ops = dpll_device_ops(dpll);
>>>+	u32 features;
>>>+	int ret;
>>>+
>>>+	if (!ops->features_get)
>>>+		return 0;
>>>+	ret = ops->features_get(dpll, dpll_priv(dpll), &features, extack);
>>>+	if (ret)
>>>+		return ret;
>>>+	if (nla_put_u32(msg, DPLL_A_FEATURES, features))
>>>+		return -EMSGSIZE;
>>>+
>>>+	return 0;
>>>+}
>>>+
>>> static int
>>> dpll_msg_add_lock_status(struct sk_buff *msg, struct dpll_device *dpll,
>>> 			 struct netlink_ext_ack *extack)
>>>@@ -592,6 +611,11 @@ dpll_device_get_one(struct dpll_device *dpll, struct
>>>sk_buff *msg,
>>> 		return ret;
>>> 	if (nla_put_u32(msg, DPLL_A_TYPE, info->type))
>>> 		return -EMSGSIZE;
>>>+	if (nla_put_u32(msg, DPLL_A_CAPABILITIES, info->capabilities))
>>>+		return -EMSGSIZE;
>>>+	ret = dpll_msg_add_features(msg, dpll, extack);
>>>+	if (ret)
>>>+		return ret;
>>>
>>> 	return 0;
>>> }
>>>@@ -747,6 +771,34 @@ int dpll_pin_change_ntf(struct dpll_pin *pin)
>>> }
>>> EXPORT_SYMBOL_GPL(dpll_pin_change_ntf);
>>>
>>>+static int
>>>+dpll_features_set(struct dpll_device *dpll, struct nlattr *a,
>>>+		  struct netlink_ext_ack *extack)
>>>+{
>>>+	const struct dpll_device_info *info = dpll_device_info(dpll);
>>>+	const struct dpll_device_ops *ops = dpll_device_ops(dpll);
>>>+	u32 features = nla_get_u32(a), old_features;
>>>+	int ret;
>>>+
>>>+	if (features && !(info->capabilities & features)) {
>>>+		NL_SET_ERR_MSG_ATTR(extack, a, "dpll device not capable of this
>>>features");
>>>+		return -EOPNOTSUPP;
>>>+	}
>>>+	if (!ops->features_get || !ops->features_set) {
>>>+		NL_SET_ERR_MSG(extack, "dpll device not supporting any
>>>features");
>>>+		return -EOPNOTSUPP;
>>>+	}
>>>+	ret = ops->features_get(dpll, dpll_priv(dpll), &old_features,
>>>extack);
>>>+	if (ret) {
>>>+		NL_SET_ERR_MSG(extack, "unable to get old features value");
>>>+		return ret;
>>>+	}
>>>+	if (old_features == features)
>>>+		return -EINVAL;
>>>+
>>>+	return ops->features_set(dpll, dpll_priv(dpll), features, extack);
>>
>>So you allow to enable/disable them all in once. What if user want to
>>enable feature A and does not care about feature B that may of may not
>>be previously set?
>
>Assumed that user would always request full set.

Ugh.


>
>>How many of the features do you expect to appear in the future. I'm
>>asking because this could be just a bool attr with a separate op to the
>>driver. If we have 3, no problem. Benefit is, you may also extend it
>>easily to pass some non-bool configuration. My point is, what is the
>>benefit of features bitset here?
>>
>
>Not much, at least right now..
>Maybe one similar in nearest feature. Sure, we can go that way.
>
>But you mean uAPI part also have this enabled somehow per feature or
>leave the feature bits there?

I don't see reason for u32/bitfield32 bits here. Just have attr per
feature to enable/disable it, no problem. It will be easier to work with.


>
>Thank you!
>Arkadiusz
>
>>
>>
>>>+}
>>>+
>>> static int
>>> dpll_pin_freq_set(struct dpll_pin *pin, struct nlattr *a,
>>> 		  struct netlink_ext_ack *extack)
>>>@@ -1536,10 +1588,33 @@ int dpll_nl_device_get_doit(struct sk_buff *skb,
>>struct genl_info *info)
>>> 	return genlmsg_reply(msg, info);
>>> }
>>>
>>>+static int
>>>+dpll_set_from_nlattr(struct dpll_device *dpll, struct genl_info *info)
>>>+{
>>>+	struct nlattr *a;
>>>+	int rem, ret;
>>>+
>>>+	nla_for_each_attr(a, genlmsg_data(info->genlhdr),
>>>+			  genlmsg_len(info->genlhdr), rem) {
>>>+		switch (nla_type(a)) {
>>>+		case DPLL_A_FEATURES:
>>>+			ret = dpll_features_set(dpll, a, info->extack);
>>>+			if (ret)
>>>+				return ret;
>>>+			break;
>>>+		default:
>>>+			break;
>>>+		}
>>>+	}
>>>+
>>>+	return 0;
>>>+}
>>>+
>>> int dpll_nl_device_set_doit(struct sk_buff *skb, struct genl_info *info)
>>> {
>>>-	/* placeholder for set command */
>>>-	return 0;
>>>+	struct dpll_device *dpll = info->user_ptr[0];
>>>+
>>>+	return dpll_set_from_nlattr(dpll, info);
>>> }
>>>
>>> int dpll_nl_device_get_dumpit(struct sk_buff *skb, struct
>>>netlink_callback *cb)
>>>diff --git a/include/linux/dpll.h b/include/linux/dpll.h
>>>index 0489464af958..90c743daf64b 100644
>>>--- a/include/linux/dpll.h
>>>+++ b/include/linux/dpll.h
>>>@@ -30,6 +30,10 @@ struct dpll_device_ops {
>>> 				       void *dpll_priv,
>>> 				       unsigned long *qls,
>>> 				       struct netlink_ext_ack *extack);
>>>+	int (*features_set)(const struct dpll_device *dpll, void *dpll_priv,
>>>+			    u32 features, struct netlink_ext_ack *extack);
>>>+	int (*features_get)(const struct dpll_device *dpll, void *dpll_priv,
>>>+			    u32 *features, struct netlink_ext_ack *extack);
>>> };
>>>
>>> struct dpll_pin_ops {
>>>@@ -99,6 +103,7 @@ struct dpll_pin_ops {
>>>
>>> struct dpll_device_info {
>>> 	enum dpll_type type;
>>>+	u32 capabilities;
>>> 	const struct dpll_device_ops *ops;
>>> };
>>>
>>>--
>>>2.38.1
>>>

Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B16421CC74
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805476; cv=none; b=gOEP+YUu8DIWO7QiKMUiqMtAPjVpBZUY+Apl4nkY919N6/JyGJobO5P50wLAyZx+PNw0fPhMuRkhzfZPw+gBOy7BGelDsH4qOLcDgXUF49WS2xnyTWYoS6JFVYhZ8XIFzmziZFBWmpqLG+nDn/XtErkG/UwCEn+7vEsYtG8fvrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805476; c=relaxed/simple;
	bh=mVKTSnM9Oe/QUznfF2Dc69xMAAfae2qm077KOikv5c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xw+xw9vDN9xW3aAEwl8IH6iVBzr3HFTepqovPRC8U6uAWzumJSxF7P07yXymq8zsaYyrdW9x97oD7c6nfJMqqhyillrsfTnI3T9Gz1F/0WR6s5eddRf7MB7K/MOsVUYPINevoVyn8JcoE65R9fTspD0z7gEMf7+0WdMSVtNrz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=daGOE/FO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="daGOE/FO"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso6307392f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1744805472; x=1745410272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aIhNd1beHsCBJk7UARj/b4EA55X4Pt/IlSQhsaLXJEs=;
        b=daGOE/FOhacgvhjlSEPIwPxIAyjWLKguaGu/X38J8Z2kSpBxth1ZQz2R5mkTJx4Lfc
         CyIC/rqPiio5kS9pUO15ccFbhNeI7J5zXW3IX0rEJ9ik3H5lv2HORu8eNKqXufLFKxnC
         H8VpLuVYsGYkp/8cExzwAwXAY7NRlZ0TBU42WpFaf467oNFlk4sMmVvKjxjCVceUYuos
         MSiNZ/tauCATlUEMx/zEEhmBHkwu5N3uNbhZdZcqi/dnnAayAWcm/Vk8d+bT3qzLhIuj
         FaXxYoO/uWtXEQkHLwyA/R4dD+BTHQGrNQnGY8GeJ8AJu75c42azCOKeebYyVF3OyScq
         0KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805472; x=1745410272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIhNd1beHsCBJk7UARj/b4EA55X4Pt/IlSQhsaLXJEs=;
        b=OCqhoe9gfhLeLvJe2Cff6zQpN9ceLuWgnTKpzAvn1HcssicVccDOFuyU80iWbgVir+
         XEK9jCUdEjVpk3IPE9KCRZks0Z4p2WETM5AK/DAIyS7VHn4HteJW8I/LUhXX5rnWesHG
         WXrdsIMO/qtrkrE9QIaNLjFt+fuYsCFXC7JAjuZOrjsD2Wj9N8i35oDgdXG+fSBAsGdX
         HdDgAvUZIPLM8iriNirS8+JSqwmg2ukADTGGYVfMR/cKe+julThYsAAy183VGqEOE6ds
         yWWCGfUDRKs066VcvTYr1ZAke66rtpEENSy8eaCE+SGdoxHX3V2sZalE/7go4KJyCWXO
         tXrg==
X-Forwarded-Encrypted: i=1; AJvYcCXBbWOY9KZV099xzxco/KodVDn1HihbGRoJ2+w6hktZUU1T8lSzr9XWMkgUcdFzsI1UDMYGbJ+OnGT4S8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTX+S5e7WVT4q43inQkRUZm1qERkhK+XxG3MWll1sefXdz3m4r
	ERYAiPhv7nOLwyAAzuhbv5wrJJGfN1ruTobVh4I8/tzP4MzWIEo3QXhZLvmhhhY=
X-Gm-Gg: ASbGncsICt8OPuMTQFcLidGV9QCORCe3DziXd8ofEbnxKD/b5nxAPeBxlsouORHPmJ6
	8iFlyWAJxVOWe8O2dnbxyuwQOiGFifZ+mkxxeFH8JPoOHP8jAGoZQV+SaGq5w9/5RYYdiJFS6s3
	AIegam7IuskQnXOO2jTXUxnrF9KQVV+RgAuMw22trFVSMJyn1JbcmrsDufnStaDJyWl3wPV8pW1
	X3FJ3hWzUKe9rTJ0UHP4Ih+5vbJTVcotB2OLaQ4kjsaMGsOKR0L1xmTWOsnVzLZzsZN/lXtOBHz
	LimVVU1u7Ua44B4BNuYoGteFOWHdhZy8/TxeA/JQYN4mCYdUp8m2i6Cg7Is=
X-Google-Smtp-Source: AGHT+IGIAwh5paKCg/g4lQlBIPqJRZL9OcDB9OvQKhMNNe2NevcI1jcoYQQlLpJ2/+Ng8JEWh1CHCQ==
X-Received: by 2002:a05:6000:40cd:b0:39c:13fd:ec44 with SMTP id ffacd0b85a97d-39ee5b138fdmr1428303f8f.5.1744805472113;
        Wed, 16 Apr 2025 05:11:12 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm17110247f8f.17.2025.04.16.05.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:11:11 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:10:59 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org, vadim.fedorenko@linux.dev, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, 
	saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, jonathan.lemon@gmail.com, 
	richardcochran@gmail.com, aleksandr.loktionov@intel.com, milena.olech@intel.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/4] dpll: features_get/set callbacks
Message-ID: <lljouuqzmhcb2esfrxrviohrwgweee6632ntfoca5fqho736il@auarfibpahpf>
References: <20250415181543.1072342-1-arkadiusz.kubalewski@intel.com>
 <20250415181543.1072342-4-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415181543.1072342-4-arkadiusz.kubalewski@intel.com>

Tue, Apr 15, 2025 at 08:15:42PM +0200, arkadiusz.kubalewski@intel.com wrote:
>Add new callback ops for a dpll device.
>- features_get(..) - to obtain currently configured features from dpll
>  device,
>- feature_set(..) - to allow dpll device features configuration.
>Provide features attribute and allow control over it to the users if
>device driver implements callbacks.
>
>Reviewed-by: Milena Olech <milena.olech@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>---
>v2:
>- adapt changes and align wiht new dpll_device_info struct
>---
> drivers/dpll/dpll_netlink.c | 79 ++++++++++++++++++++++++++++++++++++-
> include/linux/dpll.h        |  5 +++
> 2 files changed, 82 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
>index 2de9ec08d551..acfdd87fcffe 100644
>--- a/drivers/dpll/dpll_netlink.c
>+++ b/drivers/dpll/dpll_netlink.c
>@@ -126,6 +126,25 @@ dpll_msg_add_mode_supported(struct sk_buff *msg, struct dpll_device *dpll,
> 	return 0;
> }
> 
>+static int
>+dpll_msg_add_features(struct sk_buff *msg, struct dpll_device *dpll,
>+		      struct netlink_ext_ack *extack)
>+{
>+	const struct dpll_device_ops *ops = dpll_device_ops(dpll);
>+	u32 features;
>+	int ret;
>+
>+	if (!ops->features_get)
>+		return 0;
>+	ret = ops->features_get(dpll, dpll_priv(dpll), &features, extack);
>+	if (ret)
>+		return ret;
>+	if (nla_put_u32(msg, DPLL_A_FEATURES, features))
>+		return -EMSGSIZE;
>+
>+	return 0;
>+}
>+
> static int
> dpll_msg_add_lock_status(struct sk_buff *msg, struct dpll_device *dpll,
> 			 struct netlink_ext_ack *extack)
>@@ -592,6 +611,11 @@ dpll_device_get_one(struct dpll_device *dpll, struct sk_buff *msg,
> 		return ret;
> 	if (nla_put_u32(msg, DPLL_A_TYPE, info->type))
> 		return -EMSGSIZE;
>+	if (nla_put_u32(msg, DPLL_A_CAPABILITIES, info->capabilities))
>+		return -EMSGSIZE;
>+	ret = dpll_msg_add_features(msg, dpll, extack);
>+	if (ret)
>+		return ret;
> 
> 	return 0;
> }
>@@ -747,6 +771,34 @@ int dpll_pin_change_ntf(struct dpll_pin *pin)
> }
> EXPORT_SYMBOL_GPL(dpll_pin_change_ntf);
> 
>+static int
>+dpll_features_set(struct dpll_device *dpll, struct nlattr *a,
>+		  struct netlink_ext_ack *extack)
>+{
>+	const struct dpll_device_info *info = dpll_device_info(dpll);
>+	const struct dpll_device_ops *ops = dpll_device_ops(dpll);
>+	u32 features = nla_get_u32(a), old_features;
>+	int ret;
>+
>+	if (features && !(info->capabilities & features)) {
>+		NL_SET_ERR_MSG_ATTR(extack, a, "dpll device not capable of this features");
>+		return -EOPNOTSUPP;
>+	}
>+	if (!ops->features_get || !ops->features_set) {
>+		NL_SET_ERR_MSG(extack, "dpll device not supporting any features");
>+		return -EOPNOTSUPP;
>+	}
>+	ret = ops->features_get(dpll, dpll_priv(dpll), &old_features, extack);
>+	if (ret) {
>+		NL_SET_ERR_MSG(extack, "unable to get old features value");
>+		return ret;
>+	}
>+	if (old_features == features)
>+		return -EINVAL;
>+
>+	return ops->features_set(dpll, dpll_priv(dpll), features, extack);

So you allow to enable/disable them all in once. What if user want to
enable feature A and does not care about feature B that may of may not
be previously set?
How many of the features do you expect to appear in the future. I'm
asking because this could be just a bool attr with a separate op to the
driver. If we have 3, no problem. Benefit is, you may also extend it
easily to pass some non-bool configuration. My point is, what is the
benefit of features bitset here?



>+}
>+
> static int
> dpll_pin_freq_set(struct dpll_pin *pin, struct nlattr *a,
> 		  struct netlink_ext_ack *extack)
>@@ -1536,10 +1588,33 @@ int dpll_nl_device_get_doit(struct sk_buff *skb, struct genl_info *info)
> 	return genlmsg_reply(msg, info);
> }
> 
>+static int
>+dpll_set_from_nlattr(struct dpll_device *dpll, struct genl_info *info)
>+{
>+	struct nlattr *a;
>+	int rem, ret;
>+
>+	nla_for_each_attr(a, genlmsg_data(info->genlhdr),
>+			  genlmsg_len(info->genlhdr), rem) {
>+		switch (nla_type(a)) {
>+		case DPLL_A_FEATURES:
>+			ret = dpll_features_set(dpll, a, info->extack);
>+			if (ret)
>+				return ret;
>+			break;
>+		default:
>+			break;
>+		}
>+	}
>+
>+	return 0;
>+}
>+
> int dpll_nl_device_set_doit(struct sk_buff *skb, struct genl_info *info)
> {
>-	/* placeholder for set command */
>-	return 0;
>+	struct dpll_device *dpll = info->user_ptr[0];
>+
>+	return dpll_set_from_nlattr(dpll, info);
> }
> 
> int dpll_nl_device_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
>diff --git a/include/linux/dpll.h b/include/linux/dpll.h
>index 0489464af958..90c743daf64b 100644
>--- a/include/linux/dpll.h
>+++ b/include/linux/dpll.h
>@@ -30,6 +30,10 @@ struct dpll_device_ops {
> 				       void *dpll_priv,
> 				       unsigned long *qls,
> 				       struct netlink_ext_ack *extack);
>+	int (*features_set)(const struct dpll_device *dpll, void *dpll_priv,
>+			    u32 features, struct netlink_ext_ack *extack);
>+	int (*features_get)(const struct dpll_device *dpll, void *dpll_priv,
>+			    u32 *features, struct netlink_ext_ack *extack);
> };
> 
> struct dpll_pin_ops {
>@@ -99,6 +103,7 @@ struct dpll_pin_ops {
> 
> struct dpll_device_info {
> 	enum dpll_type type;
>+	u32 capabilities;
> 	const struct dpll_device_ops *ops;
> };
> 
>-- 
>2.38.1
>

Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3D26A0EA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771318; cv=none; b=gM7kgUgQHtKvHrIfgk6BmmsXzAmExbqRjOKej7hINqXvzs+7KjEWfYnwC55BlAlUKG23Kz62Bj5GtaN7IVIQQOQsCdlcdb+8ebE3Wq63NrWkU882xuMfZRy/BveD9VofgZajyfY0qYryhYMKiiwf5j6H7aIHoKxIe52njpU89vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771318; c=relaxed/simple;
	bh=1739CLRRzTngl2V+KKerMtAG/7AzFqZExCvSW0Xuodg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Od2MSejOvgKUNFTdaMOo0URsjGeXS3V3TlP44tFg8ILfDS5dSppN/Th/IgujUYLAmDBFh5qiQsPJ2h83R0d+9G7407M1MQar5v3TVLrXSScicaVz3pbsBMVvB3Hw3wVgFaUf/GrAen6v+vdivOayw+mULWR+41RgJQWQGdE7cck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=j33kj/J+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="j33kj/J+"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so3337199a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 23:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1746771315; x=1747376115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ayrOtjvDhxlG7NNzEFdSAtZUMUsCsoAzJrwzEXbZsU=;
        b=j33kj/J+iDlL6P06UkuIkyilpk5wS/gKBlIHWHbMTM2NYKCGYckfQnK/ixvDXGqTl9
         DzPXQF/qD7jUvPvnVysmos5uthVxMC0jGHH2QM7+MDrw0v8LNXj2/+LNSqUayIEH4it0
         w56mm+oEQnDm2M8faRvETYwvpW64qthdcLjZ8Sat7mjtJ4HpSXCtTn87NJGlMfOiSXNT
         al0Z7zSMT96YursH3BZWiGNMdrHgK5Xp04Wkh6Ro0Ovamll7eXZS9SoNaNk3Qtzr5x4N
         ohmsKfMbnRpXCjCNw9L3+mmjPvU4SfQJtI8kxBGT3X6rVEj1FBdMAfBaX2ovmZG0yLOm
         zfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746771315; x=1747376115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ayrOtjvDhxlG7NNzEFdSAtZUMUsCsoAzJrwzEXbZsU=;
        b=AwolDef5dFqwPIHO8fv0sCJQjdwEMpin87S0jxOaUwI2pLzILNE1iZ3EcKiTaha2xH
         qiBstehK06viNCIEETfV2A3n0oRKiXwbvqjcAA4PB3KlNfPkGiFipyUxHjzx+3uFcBhE
         jiWdDxB2QXl8lSkrsovAjQehL/cjVmGWwv+cL3ASp3r0zQexP9Z+Ylj5TCY76C0DviBz
         k4XuifKiKvPzePXTL1nnWPrVaAmyNX4zmr3Da0MiqC5o0+PxKUVxbcChWshx1DhTTxBj
         69WsyTT08b+gjzkqVjdRVgp2psIGQwz7FqPvVO9bMbpc71FNwLbatKCIrsR9rXTUwX/A
         hlOg==
X-Forwarded-Encrypted: i=1; AJvYcCUC5MBzgSbrhpJNShEK+Zp0eQc3lD5ZlaP5Z9RnhGBouO5Mqfj5Awn60MGSjysK7yOBNHmjiN6QjIa3OlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF+wa+iqLSLEs6SmaYgjmCC12tZCd5y+yIc+g6+hvzma+zfsHh
	kr3gi7/nmY0LJ8W5byZIxsB4s6F4SR5I1lFsf0HdEI7M5VrojqU6rkTMvYaFQrs=
X-Gm-Gg: ASbGnct0sTrdef2qMxzKt3k7VMlnBah9G3JMT06XRUT1ggWWu4j1s69lvK7/ddCsNC/
	Pz5Tuwef++Yhw95jvmPCJvAoJN+l6fXHXUUwmA+YNcT+PzxoHTOKhqp2zwIPvzptJ2gwRtSyadx
	T7kuXN/e8kWC6xCQLlFzSO6tO0epm4TATpHsSuyN6ZBV0dWTnNsFg1bxxG7ik4gIvaifpmfqHo+
	NJ+QDqJezKQNTP5AfgrugsMxyXhmG7DT7TIm6nxSzu7N6Bfk4W4LiV+UeXxT7un+c5Rs09+SYe5
	O7NpwGdYwfqnVRH9r7Yl8msQGuRpjGnwhStLpSlgqZMdK5K3wAvpCBP7PBfRPywLHgk6yRf8
X-Google-Smtp-Source: AGHT+IF7TNT1gd0+H5ZbT5vG1P2EdDoPfo61Uc/AnB0BWRRU2rdWfsNEuVC5kNxFod003BomXcVd+w==
X-Received: by 2002:a05:6402:34c6:b0:5f6:212f:ed3 with SMTP id 4fb4d7f45d1cf-5fca07707eamr1650378a12.15.1746771314844;
        Thu, 08 May 2025 23:15:14 -0700 (PDT)
Received: from jiri-mlt.client.nvidia.com ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc26e3dsm923190a12.27.2025.05.08.23.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:15:14 -0700 (PDT)
Date: Fri, 9 May 2025 08:15:04 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc: "donald.hunter@gmail.com" <donald.hunter@gmail.com>, 
	"kuba@kernel.org" <kuba@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, 
	"edumazet@google.com" <edumazet@google.com>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"horms@kernel.org" <horms@kernel.org>, "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>, 
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>, 
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "saeedm@nvidia.com" <saeedm@nvidia.com>, 
	"leon@kernel.org" <leon@kernel.org>, "tariqt@nvidia.com" <tariqt@nvidia.com>, 
	"jonathan.lemon@gmail.com" <jonathan.lemon@gmail.com>, "richardcochran@gmail.com" <richardcochran@gmail.com>, 
	"Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>, "Olech, Milena" <milena.olech@intel.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: [PATCH net-next v3 2/3] dpll: add phase_offset_monitor_get/set
 callback ops
Message-ID: <we7ev4qegycbn6vp2epoeq45kulkpurdh2dga7zgmx6xq5hy2e@nkjmo3njtwo7>
References: <20250508122128.1216231-1-arkadiusz.kubalewski@intel.com>
 <20250508122128.1216231-3-arkadiusz.kubalewski@intel.com>
 <rwterkiyhdjcedboj773zc5s3d6purz6yaccfowco7m5zd7q3c@or4r33ay2dxh>
 <SJ2PR11MB8452820F6BDF445F29D368C99B8BA@SJ2PR11MB8452.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB8452820F6BDF445F29D368C99B8BA@SJ2PR11MB8452.namprd11.prod.outlook.com>

Thu, May 08, 2025 at 05:20:24PM +0200, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Thursday, May 8, 2025 4:31 PM
>>
>>Thu, May 08, 2025 at 02:21:27PM +0200, arkadiusz.kubalewski@intel.com
>>wrote:
>>>Add new callback operations for a dpll device:
>>>- phase_offset_monitor_get(..) - to obtain current state of phase offset
>>>  monitor feature from dpll device,
>>>- phase_offset_monitor_set(..) - to allow feature configuration.
>>>
>>>Obtain the feature state value using the get callback and provide it to
>>>the user if the device driver implements callbacks.
>>>
>>>Execute the set callback upon user requests.
>>>
>>>Reviewed-by: Milena Olech <milena.olech@intel.com>
>>>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>>---
>>>v3:
>>>- remove feature flags and capabilities,
>>>- add separated (per feature) callback ops,
>>>- use callback ops to determine feature availability.
>>>---
>>> drivers/dpll/dpll_netlink.c | 76 ++++++++++++++++++++++++++++++++++++-
>>> include/linux/dpll.h        |  8 ++++
>>> 2 files changed, 82 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
>>>index c130f87147fa..6d2980455a46 100644
>>>--- a/drivers/dpll/dpll_netlink.c
>>>+++ b/drivers/dpll/dpll_netlink.c
>>>@@ -126,6 +126,26 @@ dpll_msg_add_mode_supported(struct sk_buff *msg,
>>>struct dpll_device *dpll,
>>> 	return 0;
>>> }
>>>
>>>+static int
>>>+dpll_msg_add_phase_offset_monitor(struct sk_buff *msg, struct dpll_device
>>>*dpll,
>>>+				  struct netlink_ext_ack *extack)
>>>+{
>>>+	const struct dpll_device_ops *ops = dpll_device_ops(dpll);
>>>+	enum dpll_feature_state state;
>>>+	int ret;
>>>+
>>>+	if (ops->phase_offset_monitor_set && ops->phase_offset_monitor_get) {
>>>+		ret = ops->phase_offset_monitor_get(dpll, dpll_priv(dpll),
>>>+						    &state, extack);
>>>+		if (ret)
>>>+			return -EINVAL;
>>
>>Why you don't propagate "ret"?
>>
>
>My bad, will fix that.
>
>>
>>>+		if (nla_put_u32(msg, DPLL_A_PHASE_OFFSET_MONITOR, state))
>>>+			return -EMSGSIZE;
>>>+	}
>>>+
>>>+	return 0;
>>>+}
>>>+
>>> static int
>>> dpll_msg_add_lock_status(struct sk_buff *msg, struct dpll_device *dpll,
>>> 			 struct netlink_ext_ack *extack)
>>>@@ -591,6 +611,9 @@ dpll_device_get_one(struct dpll_device *dpll, struct
>>>sk_buff *msg,
>>> 		return ret;
>>> 	if (nla_put_u32(msg, DPLL_A_TYPE, dpll->type))
>>> 		return -EMSGSIZE;
>>>+	ret = dpll_msg_add_phase_offset_monitor(msg, dpll, extack);
>>>+	if (ret)
>>>+		return ret;
>>>
>>> 	return 0;
>>> }
>>>@@ -746,6 +769,31 @@ int dpll_pin_change_ntf(struct dpll_pin *pin)
>>> }
>>> EXPORT_SYMBOL_GPL(dpll_pin_change_ntf);
>>>
>>>+static int
>>>+dpll_phase_offset_monitor_set(struct dpll_device *dpll, struct nlattr *a,
>>>+			      struct netlink_ext_ack *extack)
>>>+{
>>>+	const struct dpll_device_ops *ops = dpll_device_ops(dpll);
>>>+	enum dpll_feature_state state = nla_get_u32(a), old_state;
>>>+	int ret;
>>>+
>>>+	if (!(ops->phase_offset_monitor_set && ops-
>>>phase_offset_monitor_get)) {
>>>+		NL_SET_ERR_MSG_ATTR(extack, a, "dpll device not capable of
>>>phase offset monitor");
>>>+		return -EOPNOTSUPP;
>>>+	}
>>>+	ret = ops->phase_offset_monitor_get(dpll, dpll_priv(dpll),
>>>&old_state,
>>>+					    extack);
>>>+	if (ret) {
>>>+		NL_SET_ERR_MSG(extack, "unable to get current state of phase
>>>offset monitor");
>>>+		return -EINVAL;

Propagate ret.


>>>+	}
>>>+	if (state == old_state)
>>>+		return 0;
>>>+
>>>+	return ops->phase_offset_monitor_set(dpll, dpll_priv(dpll), state,
>>>+					     extack);
>>
>>Why you need to do this get/set dance? I mean, just call the driver
>>set() op and let it do what is needed there, no?
>>
>
>We did it this way from the beginning (during various pin-set related flows).

Hmm, idk if it is absolutelly necessary to stick with this pattern all
the time. I mean, what's the benefit here? I don't see any.


>
>>
>>>+}
>>>+
>>> static int
>>> dpll_pin_freq_set(struct dpll_pin *pin, struct nlattr *a,
>>> 		  struct netlink_ext_ack *extack)
>>>@@ -1533,10 +1581,34 @@ int dpll_nl_device_get_doit(struct sk_buff *skb,
>>>struct genl_info *info)
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
>>
>>Hmm, why you iterate? Why you just don't parse to attr array, as it is
>>usually done?
>>
>
>Hmm, AFAIR there are issues when you parse nested stuff with the array
>approach, here nothing is nested, but we already have the same approach on
>parsing pin related stuff (dpll_pin_set_from_nlattr(..)), just did the same
>here.

The only reason to iterate over attrs is then you have multiattr. Is
ever attr is there only once, no need for iteration.


>
>Thank you!
>Arkadiusz
>
>>
>>>+		switch (nla_type(a)) {
>>>+		case DPLL_A_PHASE_OFFSET_MONITOR:
>>>+			ret = dpll_phase_offset_monitor_set(dpll, a,
>>>+							    info->extack);
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
>>>index 5e4f9ab1cf75..6ad6c2968a28 100644
>>>--- a/include/linux/dpll.h
>>>+++ b/include/linux/dpll.h
>>>@@ -30,6 +30,14 @@ struct dpll_device_ops {
>>> 				       void *dpll_priv,
>>> 				       unsigned long *qls,
>>> 				       struct netlink_ext_ack *extack);
>>>+	int (*phase_offset_monitor_set)(const struct dpll_device *dpll,
>>>+					void *dpll_priv,
>>>+					enum dpll_feature_state state,
>>>+					struct netlink_ext_ack *extack);
>>>+	int (*phase_offset_monitor_get)(const struct dpll_device *dpll,
>>>+					void *dpll_priv,
>>>+					enum dpll_feature_state *state,
>>>+					struct netlink_ext_ack *extack);
>>> };
>>>
>>> struct dpll_pin_ops {
>>>--
>>>2.38.1
>>>
>

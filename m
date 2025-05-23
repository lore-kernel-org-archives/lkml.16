Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D8D22CBE9
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002583; cv=none; b=CMQhY/QI7/4I3O83z4XC1xR6fbKRnzRA+TTSE7qdwJUhsxwQlFOb/A7+fp3Rmn7AXunA8rE0PqL/BveY8ZQN1ExhApNQ6fIW880vSOquhYHIxbNlwZXCEX8nbew1gmQhJm6SdlflrNp0z9XkXqXlvYuTyzWQe3yKcXNgxs8ig9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002583; c=relaxed/simple;
	bh=jBZMg+IQcsVgsl8wdECZuEm5vz1GHrzjws56Jq1ZGjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DP3yw3Cp1QApF0VUWXSYFyssoLLl8MKg6i/HtsMiQ1YaGBV/JqHZ9SGjY2yUCbUJ9fJ5T3EWlINqds54shJqr0cuRzb9UXKH3QvzLl1bTfXtmopZM4vLmYmf7VVEQM5GLWXBsehXWLBJljP7gVczy2KX9g23//t4u90fstdrRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=nG3rRsCd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="nG3rRsCd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so112343405e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1748002579; x=1748607379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UVs+40bTDiF7EnRvr0lzQVjEjCbory2b3GEFHaMHFi0=;
        b=nG3rRsCdtaUrIcw2pucw5sPQz4yykBHQpjnlsNb0EVTSVHgTQRAEGPfuKQAtIDzRbG
         nlicV38eY5fB75BukDDLVErKVLqeYpgaMH6MbgfHKbI1Xak9yRyqc5KcT+Eyyua7GrUG
         XAE26+LhVdhBY7w5q5Qg9AZu5Bz5AuhpFW4SIPUP6k2FtuYySq+PQItPTDXOfNqrvAm0
         /Y+rWtrvTfF3vuQMRae2ZABmfMKypFvgRygsxAcshYUeL0wptVIo9ehxe9+YbmQdx+iV
         TQctwIkZHSjC9vS8//Kbu2fBGzCES/lxwO7T8X9LZSo1kyOu2Wlg/7zhK8Schj7XUg6P
         GZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748002579; x=1748607379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVs+40bTDiF7EnRvr0lzQVjEjCbory2b3GEFHaMHFi0=;
        b=EZzUEQBZ6y8E66XxvRcLeqaOzSaAj+7FqZW++mfPJqzT2XHU43ByNqwMhmuGdrv0Av
         lXzjocS3yfqiDlwpXXxqkUjDM1k0mtZ5ME1WZo/PAJs+6yTtgbCAGRU7WGJTQHgxkasS
         H3Nje+2i2WZfZLzLOCibUblB8PQqQ6QX4rwFMP5rl56CUrtvjc0L3T8sZiyReeGXSJfw
         JswH+ZkUu4r0qNMkcerlM2jsSurvdFI1ku14KHuWOg2rH5Y4kZzItpVqIlGa2zeLB07i
         NjmLdlXt+ce+vUPVFULy5dttF8CIzlGeNE2Wpvk7cuTJefMQNU1vF9Dkwe5mMAgD7LzG
         N2LA==
X-Forwarded-Encrypted: i=1; AJvYcCUfAIfX4ZS3+bU2Gz44INo+71mB8K/cGXlMoDkv2lbHESIPyguN8Sad7qUABbv+ZHSdKOrr5JX3r4jnFCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsykx2Cx7ECxlZTmC2W9GAWaF4i4YNvVWstL1XS1JbHWDfthqS
	eM/+t/yVDgNbCi2LGYKEPFyP+HpirNDvmyL7nXPgWLfbSyg9GwnO1lTiF6SNgfWEuDU=
X-Gm-Gg: ASbGncuXMJiCPfCGtsRcv+zk9LBSrP8DXx9vn4nknKOoDRP6B+jis9kEWiJkRCbzwzT
	PnFNUCJ8n2BVoA/tjarCGofc+ta0GMvzjh+wCpGlJdksuf4ItOBlur3TxsK9h/eRQQZpr2ghkmQ
	PIEtRKNF6nXm0gWxB+5FlbT2pzOW1vadyZEyOMCpbYQk7a4NeWCF5xsmckihSaRGmkr3vpCAaxM
	OC+QrF5dCtJwubc0dPbHrBTxfZmNtMaz0cJsq6pzjIdWvYzZ7xqZgyujvRVG71d1cgLYC425yT9
	4uXhvQizIokV9KP84IJGHZ1iENQMSmI/f1OAtMoyC/wWdWHPu1/vcNTbIGqW7VYulDmqd3BUCuJ
	WVvg=
X-Google-Smtp-Source: AGHT+IFHQ5u5SVMHD2atXwAihGnBWqM0BV44tFIPABcerUSfvuw7HC46EhyErks5GY3aIXUfMPmPcQ==
X-Received: by 2002:a05:6000:2f87:b0:3a3:62c6:d2cd with SMTP id ffacd0b85a97d-3a4c20fe8f6mr3242914f8f.14.1748002578824;
        Fri, 23 May 2025 05:16:18 -0700 (PDT)
Received: from jiri-mlt (37-48-1-197.nat.epc.tmcz.cz. [37.48.1.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a04csm26001714f8f.23.2025.05.23.05.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 05:16:18 -0700 (PDT)
Date: Fri, 23 May 2025 14:16:15 +0200
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
Message-ID: <35nkufpaaljicqt22ta4ysj3zvursnnu5efpjzf7fdih4y5otx@q2o5puhnd3pa>
References: <20250508122128.1216231-1-arkadiusz.kubalewski@intel.com>
 <20250508122128.1216231-3-arkadiusz.kubalewski@intel.com>
 <rwterkiyhdjcedboj773zc5s3d6purz6yaccfowco7m5zd7q3c@or4r33ay2dxh>
 <SJ2PR11MB8452820F6BDF445F29D368C99B8BA@SJ2PR11MB8452.namprd11.prod.outlook.com>
 <we7ev4qegycbn6vp2epoeq45kulkpurdh2dga7zgmx6xq5hy2e@nkjmo3njtwo7>
 <SA1PR11MB84468A82953226F3C16D9CCB9B98A@SA1PR11MB8446.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB84468A82953226F3C16D9CCB9B98A@SA1PR11MB8446.namprd11.prod.outlook.com>

Fri, May 23, 2025 at 09:45:29AM +0200, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Friday, May 9, 2025 8:15 AM
>>
>>Thu, May 08, 2025 at 05:20:24PM +0200, arkadiusz.kubalewski@intel.com
>>wrote:
>>>>From: Jiri Pirko <jiri@resnulli.us>
>>>>Sent: Thursday, May 8, 2025 4:31 PM
>>>>
>>>>Thu, May 08, 2025 at 02:21:27PM +0200, arkadiusz.kubalewski@intel.com
>>>>wrote:
>>>>>Add new callback operations for a dpll device:
>>>>>- phase_offset_monitor_get(..) - to obtain current state of phase offset
>>>>>  monitor feature from dpll device,
>>>>>- phase_offset_monitor_set(..) - to allow feature configuration.
>>>>>
>>>>>Obtain the feature state value using the get callback and provide it to
>>>>>the user if the device driver implements callbacks.
>>>>>
>>>>>Execute the set callback upon user requests.
>>>>>
>>>>>Reviewed-by: Milena Olech <milena.olech@intel.com>
>>>>>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>>>>---
>>>>>v3:
>>>>>- remove feature flags and capabilities,
>>>>>- add separated (per feature) callback ops,
>>>>>- use callback ops to determine feature availability.
>>>>>---
>>>>> drivers/dpll/dpll_netlink.c | 76 ++++++++++++++++++++++++++++++++++++-
>>>>> include/linux/dpll.h        |  8 ++++
>>>>> 2 files changed, 82 insertions(+), 2 deletions(-)
>>>>>
>>>>>diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
>>>>>index c130f87147fa..6d2980455a46 100644
>>>>>--- a/drivers/dpll/dpll_netlink.c
>>>>>+++ b/drivers/dpll/dpll_netlink.c
>>>>>@@ -126,6 +126,26 @@ dpll_msg_add_mode_supported(struct sk_buff *msg,
>>>>>struct dpll_device *dpll,
>>>>> 	return 0;
>>>>> }
>>>>>
>>>>>+static int
>>>>>+dpll_msg_add_phase_offset_monitor(struct sk_buff *msg, struct
>>>>>dpll_device
>>>>>*dpll,
>>>>>+				  struct netlink_ext_ack *extack)
>>>>>+{
>>>>>+	const struct dpll_device_ops *ops = dpll_device_ops(dpll);
>>>>>+	enum dpll_feature_state state;
>>>>>+	int ret;
>>>>>+
>>>>>+	if (ops->phase_offset_monitor_set && ops->phase_offset_monitor_get) {
>>>>>+		ret = ops->phase_offset_monitor_get(dpll, dpll_priv(dpll),
>>>>>+						    &state, extack);
>>>>>+		if (ret)
>>>>>+			return -EINVAL;
>>>>
>>>>Why you don't propagate "ret"?
>>>>
>>>
>>>My bad, will fix that.
>>>
>>>>
>>>>>+		if (nla_put_u32(msg, DPLL_A_PHASE_OFFSET_MONITOR, state))
>>>>>+			return -EMSGSIZE;
>>>>>+	}
>>>>>+
>>>>>+	return 0;
>>>>>+}
>>>>>+
>>>>> static int
>>>>> dpll_msg_add_lock_status(struct sk_buff *msg, struct dpll_device *dpll,
>>>>> 			 struct netlink_ext_ack *extack)
>>>>>@@ -591,6 +611,9 @@ dpll_device_get_one(struct dpll_device *dpll, struct
>>>>>sk_buff *msg,
>>>>> 		return ret;
>>>>> 	if (nla_put_u32(msg, DPLL_A_TYPE, dpll->type))
>>>>> 		return -EMSGSIZE;
>>>>>+	ret = dpll_msg_add_phase_offset_monitor(msg, dpll, extack);
>>>>>+	if (ret)
>>>>>+		return ret;
>>>>>
>>>>> 	return 0;
>>>>> }
>>>>>@@ -746,6 +769,31 @@ int dpll_pin_change_ntf(struct dpll_pin *pin)
>>>>> }
>>>>> EXPORT_SYMBOL_GPL(dpll_pin_change_ntf);
>>>>>
>>>>>+static int
>>>>>+dpll_phase_offset_monitor_set(struct dpll_device *dpll, struct nlattr
>>>>>*a,
>>>>>+			      struct netlink_ext_ack *extack)
>>>>>+{
>>>>>+	const struct dpll_device_ops *ops = dpll_device_ops(dpll);
>>>>>+	enum dpll_feature_state state = nla_get_u32(a), old_state;
>>>>>+	int ret;
>>>>>+
>>>>>+	if (!(ops->phase_offset_monitor_set && ops-
>>>>>phase_offset_monitor_get)) {
>>>>>+		NL_SET_ERR_MSG_ATTR(extack, a, "dpll device not capable of
>>>>>phase offset monitor");
>>>>>+		return -EOPNOTSUPP;
>>>>>+	}
>>>>>+	ret = ops->phase_offset_monitor_get(dpll, dpll_priv(dpll),
>>>>>&old_state,
>>>>>+					    extack);
>>>>>+	if (ret) {
>>>>>+		NL_SET_ERR_MSG(extack, "unable to get current state of phase
>>>>>offset monitor");
>>>>>+		return -EINVAL;
>>
>>Propagate ret.
>>
>
>Sure, will do.
>
>>
>>>>>+	}
>>>>>+	if (state == old_state)
>>>>>+		return 0;
>>>>>+
>>>>>+	return ops->phase_offset_monitor_set(dpll, dpll_priv(dpll), state,
>>>>>+					     extack);
>>>>
>>>>Why you need to do this get/set dance? I mean, just call the driver
>>>>set() op and let it do what is needed there, no?
>>>>
>>>
>>>We did it this way from the beginning (during various pin-set related
>>>flows).
>>
>>Hmm, idk if it is absolutelly necessary to stick with this pattern all
>>the time. I mean, what's the benefit here? I don't see any.
>>
>
>Driver implementing callback could do that, or can be done here. Here is
>earlier/better, right?
>
>Why would we remove this pattern for one flow, and use different for
>other flows? Doesn't make much sense to me, we could change for all to
>make it consistent.

Fair.

>
>>
>>>
>>>>
>>>>>+}
>>>>>+
>>>>> static int
>>>>> dpll_pin_freq_set(struct dpll_pin *pin, struct nlattr *a,
>>>>> 		  struct netlink_ext_ack *extack)
>>>>>@@ -1533,10 +1581,34 @@ int dpll_nl_device_get_doit(struct sk_buff *skb,
>>>>>struct genl_info *info)
>>>>> 	return genlmsg_reply(msg, info);
>>>>> }
>>>>>
>>>>>+static int
>>>>>+dpll_set_from_nlattr(struct dpll_device *dpll, struct genl_info *info)
>>>>>+{
>>>>>+	struct nlattr *a;
>>>>>+	int rem, ret;
>>>>>+
>>>>>+	nla_for_each_attr(a, genlmsg_data(info->genlhdr),
>>>>>+			  genlmsg_len(info->genlhdr), rem) {
>>>>
>>>>Hmm, why you iterate? Why you just don't parse to attr array, as it is
>>>>usually done?
>>>>
>>>
>>>Hmm, AFAIR there are issues when you parse nested stuff with the array
>>>approach, here nothing is nested, but we already have the same approach on
>>>parsing pin related stuff (dpll_pin_set_from_nlattr(..)), just did the
>>>same
>>>here.
>>
>>The only reason to iterate over attrs is then you have multiattr. Is
>>ever attr is there only once, no need for iteration.
>>
>
>Ok, will do.
>
>Thank you!
>Arkadiusz
>
>[...]

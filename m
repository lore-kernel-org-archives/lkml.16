Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E61F872D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417088; cv=none; b=E63o96kN/HXrKvlshSby9hkaBEly8oGzl3bBEeGe5mDGlGqS6/cOSvhl2Nb9o8KCGFnlseN9jowAYAr4Ae2wH1Yu3K2SwdaLU3QqRJruOJaQHG5Av0syKV+x0JhtcwwkkgsC1RBR/muhO4o+/kjU/vkVfHPzEQsIc5ETr3c2wOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417088; c=relaxed/simple;
	bh=6xJQzx4C9XKRYxfQfKcV+U7e1I4Iv7BNohHvGevc1l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKH5TnE5sWs7FMnfwYVb+cjjpglXUgIzNRaxMJ/z2m52/zdPZRY0Y5dmlBsdLcebhJhre000aBFFksJ/fuPiWsuuDr6/HWAsYDmbBlwUSO8/YrDi6cb1MiNi4mND0K/Ahmhnnx6U/FARxuKcc6ItmmFD6uODXwPNhhiEMVaTcZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ff6Tt3Wk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ff6Tt3Wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748417086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6XYHyB+9SF/Z+X8QKiEUWQZQ80MVzujdD87l+S5+Um8=;
	b=ff6Tt3WkDfS/WEuuQYI8kxdyNwFSZMOSvcGPDm6CZsAP2i1rvkwkpi6o+K+e2gbjoN2SwN
	/9cqQXQj9Dt6VoK9YwyREchpeDFjjgO/QHRaq51MyX8kiygMhzWEcfuXiW8OdtmeuUMelY
	uzRUr8xqOU1YNPopnODosrZogkDODmo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-G_7PA-QhPBmZjA_oitwmHw-1; Wed, 28 May 2025 03:24:44 -0400
X-MC-Unique: G_7PA-QhPBmZjA_oitwmHw-1
X-Mimecast-MFC-AGG-ID: G_7PA-QhPBmZjA_oitwmHw_1748417083
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442cd12d151so35839985e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417083; x=1749021883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XYHyB+9SF/Z+X8QKiEUWQZQ80MVzujdD87l+S5+Um8=;
        b=EqJhIuCVBwcqHB9BrFN2R/UBWuzY62oA0EXPYCCH/qmSgQXdQnu70c2JSWvWi1Mj3r
         yEuDE6rt5CxpTaMrYvenzQL4Sx+sIrZDQdMkP1EE4132b1ZQvAgMjfXH/qOFo8l8J8C5
         /LcjS+7+FZXYUC8MQpROiJaHQeFrl21cSfzRgZz5Vmwds5lISSFhO0r/V2JYJ41erGFZ
         eRnHSPPBL6ohHsIXH3M248/tR3IyYGseuJqgxk1KIVqntZ73q9PYzNMAkZv6907YxGcU
         TYOpDMpvLoj6INXifUF4dcAuZkr5+BoZ+eRXXaAcs/y4acPYUaeuSKTon+1OOATfUDrq
         tS0w==
X-Forwarded-Encrypted: i=1; AJvYcCUS40wvLwWtx0nXMNUrmJAxhSXI7eVNUVEefGDByrAeY/SuvtiUIv6tQyqqE/oBnzKTIPE9I4QpR+oTqV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKxO8dXwK6UW23S/U76EdQk+x1Txpxd16M1XjwsYiWWQsa9jRe
	oPPfubPj5LeeUoy7RaCWlhbAnECyCgAaSzMeKtvg9M9QbBiD2Ng9KabhV5sll9QSRqFLfInq6WY
	9vP7z+Q0yVKIjGN+3tEuWn06RvIRcFx9cVxJEzrm4N8EO3lNlt75uyiH5O8E/sTD2mQ==
X-Gm-Gg: ASbGnctxZ6o5+Gxa35Lre19ec/H6naQeZSHdv4Z7FCI82x4m35isnAWK0YpZFiJdwfQ
	6E1vbfqoq942hAkTffv0keNberBpNWvn37pLh7h+fj6xi7HmwosukxDujJ3tb97w5sV8F6w2WMr
	WkyKXD3LzulpIHVMNtM7ZaIVkUg0xOk671MECh+355HG0Q9zmw/sG68ohsjgst6lc6dGmLoQINK
	IvkNkzJReVm/lQUswoswEVEStTu//ks9UO2POHnu4JGknfOcSUIEwXTsjrPwm4Tfa2CUPCcJl5n
	bmu5LUl6bhAnBTBDOQ+PdyNiUGkqwL+xZTBQXKCfcWe/HCiu6QMbc5JfrpI=
X-Received: by 2002:a05:600c:5618:b0:441:a715:664a with SMTP id 5b1f17b1804b1-44f840b38bcmr46892705e9.20.1748417083454;
        Wed, 28 May 2025 00:24:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCqE1uwRo600JGmvrx2hbwcJjRSG8+fqxy1BRdw24yujy5GkHaEMyOu3ekjIht4ITlGdwQlA==
X-Received: by 2002:a05:600c:5618:b0:441:a715:664a with SMTP id 5b1f17b1804b1-44f840b38bcmr46892395e9.20.1748417083030;
        Wed, 28 May 2025 00:24:43 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810:827d:a191:aa5f:ba2f? ([2a0d:3344:2728:e810:827d:a191:aa5f:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064ae775sm11977185e9.22.2025.05.28.00.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:24:41 -0700 (PDT)
Message-ID: <dbc34cfe-c788-46bb-bd26-793104d887ab@redhat.com>
Date: Wed, 28 May 2025 09:24:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/3] dpll: add reference-sync netlink
 attribute
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, vadim.fedorenko@linux.dev,
 jiri@resnulli.us, anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, aleksandr.loktionov@intel.com, corbet@lwn.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
 linux-doc@vger.kernel.org, Milena Olech <milena.olech@intel.com>
References: <20250523172650.1517164-1-arkadiusz.kubalewski@intel.com>
 <20250523172650.1517164-2-arkadiusz.kubalewski@intel.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250523172650.1517164-2-arkadiusz.kubalewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/23/25 7:26 PM, Arkadiusz Kubalewski wrote:
> Add new netlink attribute to allow user space configuration of reference
> sync pin pairs, where both pins are used to provide one clock signal
> consisting of both: base frequency and sync signal.
> 
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Reviewed-by: Milena Olech <milena.olech@intel.com>
> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Same reasoning of the other series, please repost after the merge
window, thanks!

Paolo


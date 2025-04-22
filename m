Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222B2820D7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331023; cv=none; b=WsAlYvt316kcFwbDkz8rK7rl43XwgVZTUqCHbFeSbastgJU4fZ7jwnQ52NKo1ac6QJfmBDLAl/YB+gKUcoRhJCynea9KWurjMmiDqKxP9PRrTfU2B1bZ/i3Y3OgN6IAvzGcTGU6T3ncMwaIw3lnUmXZApxwDTVkgmw1JFo/ItHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331023; c=relaxed/simple;
	bh=ARspZ2ykOpo5aRuFY/beHaoHmbHtJMxGB/pUuZ2VOOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJqwNSveJplFih6dMs1pSHn5fiOWhMtrAuaR0LQt+jOfxRN2nXcUAroX3KLZyqwRs6sn+sjZjWEXDfrmSq9zbFNI6L1QffUvmw0U+x1TGsd6MRXeeMOWyXD5Jk1cj/6K1eiixzPSl+mY6Ss86onEuhTQ+3KjwzgaL0c4Kyp6ZZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qd1Cfzkr; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qd1Cfzkr"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso5774855a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745331020; x=1745935820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs/aE9VBUtWkbTYcRJAW9cr2FVba/GqgJ4VTSr8qjZw=;
        b=Qd1Cfzkr+u4N2V+dZFXxgQFHDf4ZU8d/q1KOL00OMJ1vqfz01XeokNqYUfifd0+lJr
         ADP5wP3BGU6SvzbxnVvxsoOKsGyyz9HhFRfzyHGN+mYc9kloVoEQQCoftxMEYve/p8kH
         M25lxBiRnNXR+0MpcGl+UUrDSMThzKNiHfe0rqHObJR/ZKLNnEIqrXkVikV86bpPZmtq
         B9wRFyw2KNqZcjgs++mLy4U7PyDJs8sLS3YnbZBvOTTbAvhu8L4JmsjEYtwz+mbHLtiv
         9liRVZgHZ+8r/vy2aBd7Li4TtM+GonpBoktsy9alVBOrtf4RJGBrfKEAZoSoR7LTrkMj
         Yr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331020; x=1745935820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bs/aE9VBUtWkbTYcRJAW9cr2FVba/GqgJ4VTSr8qjZw=;
        b=Y2OTjpsIQJyGc+hkICpllZY3McYItJvEYjuonTXJe5e6L6lQtqQ1Z2hkzqwanCCzfR
         XQxrw4WrMf9LY0HtOA2qeE2Wppp9GM50mj7fpjUxwSCqh9ztTlOws2SzsluJfgfbgMhE
         6etG2bneHCRuKZ5Kgqxs4RMfGiOm3YAxL4bEZE64vXY3OoW9xkEv6+2Vku+Wo1yB7epC
         oyn4KVjQ5ieP8WKql/jcPqoUoWIf5CFY+iRu0Wh6/t9OUAyhOLakMrqSyVcOERRHiKuF
         CcSfXDVkVYzXC87c80db8iIsIjLvgOC+F2sWxAMhCLL2rDwY2HCdXoBByvSyLH2rOS3s
         8znA==
X-Forwarded-Encrypted: i=1; AJvYcCWqFJrK6kaXuH279AWXcaYcT75q5suJ8h7+uQ9TGLsfKwXgHlfFxQFLMFkbYbsFXT+LaNHYaN/wu9PNGuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrwO3d3KrHS4ybl4ZFDraWqwDwCV1J1e0A0ViM+wKCfArDSlN2
	tlUvEX2D7oLXokg6HX7AzqVW0WHxRrKdTGDIWmlBPUPWWRxPvceZr3FtHawkQMk=
X-Gm-Gg: ASbGncsbmVUXlr8/JPyiWeBM6vJWbqG/RxSFLJhY4SbLSuQz+fbgrzPG+1m6Yb88IOf
	MfLNAvn0hHuj35qvkwrs1fbOSF03sZjWYQwfZi9Y13xI3/0V6QF04L64LrMuLly6mUCaP/47Bje
	9t80Ndov4a3NFxsTG3LKxkD2lRuvmGHeK6dupmyW5bYoCdiGSllwU6qtOaKUlZYAJ+wgkhNH6yz
	LF8GQe1vxfVsznCzXUa6NJ5tdZzhVxp5eNKUHlBKuH15QB/NXVViVqY65jCWoD5MJHTIFde2tf5
	ngo9YSW9/tHG3eHTJ37essGcdVpQjipghWtkOg==
X-Google-Smtp-Source: AGHT+IGSxDHn1oc0UD2CkTcdu1FzGaJupZaMzOQ7CTorW8aiy1O1jrh0PHmOMnjcVt95Ys7UnKelxA==
X-Received: by 2002:a05:6402:1d4c:b0:5f4:c7b5:fd16 with SMTP id 4fb4d7f45d1cf-5f6239dd7b5mr15160699a12.6.1745331019689;
        Tue, 22 Apr 2025 07:10:19 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625592cffsm5911761a12.35.2025.04.22.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:10:18 -0700 (PDT)
Date: Tue, 22 Apr 2025 17:10:17 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/11] pmdomain: core: Export a common ->sync_state()
 helper for genpd providers
Message-ID: <aAejSTtrgufWInZk@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-8-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-8-ulf.hansson@linaro.org>

On 25-04-17 16:25:05, Ulf Hansson wrote:
> In some cases the typical platform driver that act as genpd provider, may
> need its own ->sync_state() callback to manage various things. In this
> regards, the provider most likely wants to allow its corresponding genpds
> to be powered-off.
> 
> For this reason, let's introduce a new genpd helper function,
> of_genpd_sync_state() that helps genpd provider drivers to achieve this.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDF61B6D10
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738234443; cv=none; b=mZRLM7nfUl0F3kxw4nPZkWRNaB5Pi+qv+9eB9WyJ/xCTI0EyxoyTPC+Y4656ed0AuGt+EvvYdw/WmE3LvGzYoYqWunOAZlyMBj6pBLW5T8+M//7MnvKQs8Nb93YcwEFOx6rfqEaPU7RPWXulSqxAB22vx+MUO24uMXMFdycR5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738234443; c=relaxed/simple;
	bh=9HTHek1dmkQ8Qe+MriUAq+WvBkohEfAoyj0Y9lB3LNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtZxWhvXH7cnuG2ud7J88QWR0VPDIaaACess3gN2HSiUDkm8hbE8uwQYY9DdBPH9a+LNYXvJEajVqXzzxSrQwveE0NCWnTyazXjczdah28GaZx/J0HtL9HRvR/kM+ortIDHgafZBZOF4dLx9CPMpQc2i2HXhiroU4aH6kczu0g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FhgHYfWe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FhgHYfWe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43635796b48so3710835e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 02:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738234439; x=1738839239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=463H0ryAldONuNur80/Z8cz/xApgRCPX52vvMZzIz4Y=;
        b=FhgHYfWeK+JPkPebotIDq1VUD7TaYjz9dOM3WauscsfNE76Oa0E9hVyGWmypylpHa1
         pdRUMZwM+WGTFrUesOWJk8RDME4qIRzylqxWaJNwlc0ut0ZZBYvgITDpcL41/4hYtElK
         SCHiQxgVxWrkgvka9KHRhdrD+OvFRphK1JDV+ptm9pbSrnJnV01nIG7ekU67K08uiRXu
         kyQxg5SlSCrxNcw79vODavIxPTzU3nc2+lqVJQGBacxJElCCH3DeFjS8a7g1eH76mwNt
         VxDKiFjUE2yCXIGFsDsmTjmAYLJKMYhQkskXVDlx6iOQcAW8XRSI+9Sq2XShCaiZOFJo
         NSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738234439; x=1738839239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=463H0ryAldONuNur80/Z8cz/xApgRCPX52vvMZzIz4Y=;
        b=RH5M0fatxdV4UHL4weBe+d04gLWlJUO3N4LGnDbTd9JGHM7W+itGDKosmKAlhMcDSD
         Or9f85HgM66/JwVnKjngLlKmO+cZz5NY2ktZEfDU93+q906gpCgxjQmgja4WFM77bSBr
         QkKJ9K5JFQ2UyycCQj/FarnR57gwONc0dklfsMkjqeV/ZDIg3Ftz3+DU3UKnp7JY/Pff
         x6TlCqhjw7IdLD7VT+KClqys/QYqPuwlJzFrBYk5Iv6nMifaRZFXx+F/2kAa/wSNnTcd
         J2IyQbA5avXDjq11E2DBRpROa/kefqaVmz9VvqxuQruy7Z/JKKwqMyPqcsVvTHfKgNTU
         +/IA==
X-Forwarded-Encrypted: i=1; AJvYcCWYmRfWpq7IS1RZrTqUHf6x2igOhZ+uf+K92ULMcIIglRtHbSfSrs9B0g7+AZU7m9c+2rSR844+UEs/Wzo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywko/YRqGa2J381DiJYvN1HotyYy+hOasH6KcTdEpyu8XeER7aC
	YoapwhtdysCAqTeqTqXtHONStjBop0IBeQiGEje1mwZBoeLixlmIaqaXK9qxkeM=
X-Gm-Gg: ASbGnctBKLb5RwydmWDgRyOivMptJDVGh/ADprcyMRGmsW2636SZZWKuDS9j5TaQQWJ
	92D3WqSpdbleXuTYd1YG7KX6VajyTe/rnN6clyLAtYqdxC3j3uD5OYvhbWnGafekNrD2SBf3xFu
	+++tZnPf5r65zn7SE4q+fKaf2FGew7kIVQ69Ynh6VUIuyAcl7ItSEOIvRVn2RU7kcnbXSMMDA0L
	2jNfuj+TYZDjF6jcKeP+gmmQaC+6nkWYJWcKrEtlBtf1A1mt3SnZoo4KzcRIVKTmHYitfvz2qxm
	3zrsKl5Guyaokg==
X-Google-Smtp-Source: AGHT+IHiDFpxMP68wQ6LjOR1WCEBWr3xqs+Yj4+VT6M4CR/kMwsvp5X0TCoKZFy4smul3HHtJfE/4Q==
X-Received: by 2002:a05:600c:4710:b0:436:1af3:5b13 with SMTP id 5b1f17b1804b1-438e171a60fmr24268765e9.15.1738234439389;
        Thu, 30 Jan 2025 02:53:59 -0800 (PST)
Received: from linaro.org ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6df2asm54389675e9.29.2025.01.30.02.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 02:53:58 -0800 (PST)
Date: Thu, 30 Jan 2025 12:53:57 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH RFC v2] soc: qcom: pmic_glink: Fix device access from
 worker during suspend
Message-ID: <Z5taRZ0om5y/DJ69@linaro.org>
References: <20250129-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v2-1-de2a3eca514e@linaro.org>
 <Z5tJvgrYS5UoAHRD@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5tJvgrYS5UoAHRD@hovoldconsulting.com>

On 25-01-30 10:43:26, Johan Hovold wrote:
> On Wed, Jan 29, 2025 at 01:46:15PM +0200, Abel Vesa wrote:
> > For historical reasons, the GLINK smem interrupt is registered with
> 
> Please spell out these reasons so that we can determine if they are
> still valid or not.

Sure.

Bjorn, Caleb, please correct me if I'm wrong, but IIRC the historical
reasons here have to do with notifications from mdsp and sdsp being
needed on mobile platforms. Was there something else?

> 
> > IRRQF_NO_SUSPEND flag set, which is the underlying problem here, since the
> > incoming messages can be delivered during late suspend and early
> > resume.
> > 
> > In this specific case, the pmic_glink_altmode_worker() currently gets
> > scheduled on the system_wq which can be scheduled to run while devices
> > are still suspended. This proves to be a problem when a Type-C retimer,
> > switch or mux that is controlled over a bus like I2C, because the I2C
> > controller is suspended.
> 
> This is not just an issue with an i2c retimer, this is a plain generic
> bug in that the glink code which is calling drivers while their devices
> are suspended.

Yes, that's true. I merely used the i2c scenario since this is the first real
usecase where this proves to be a problem. I do agree that this is a
problem in the glink code design though and needs to be reworked
properly.

> 
> > This has been proven to be the case on the X Elite boards where such
> > retimers (ParadeTech PS8830) are used in order to handle Type-C
> > orientation and altmode configuration. The following warning is thrown:
> 
> > The proper solution here should be to not deliver these kind of messages
> > during system suspend at all, or at least make it configurable per glink
> > client. But simply dropping the IRQF_NO_SUSPEND flag entirely will break
> > other clients.
> 
> Which clients? Do we care enough about them to be papering over this
> very real bug which can potentially crash the system (e.g. due to
> unclocked register accesses)?

Well, you just pointed out the ucsi below, which I totally missed.

I guess this fix would have to be replicated to ucsi as well in this
case. But then it is not just a one-off anymore, like Bjorn suggested.

Since this hasn't proved to be a problem until now, I guess all the
other clients are fine with scheduling work while suspended. But this
might be a wrong assumption as well.

> 
> > The final shape of the rework of the pmic glink driver in
> > order to fulfill both the filtering of the messages that need to be able
> > to wake-up the system and the queueing of these messages until the system
> > has properly resumed is still being discussed and it is planned as a
> > future effort.
> > 
> > Meanwhile, the stop-gap fix here is to schedule the pmic glink altmode
> > worker on the system_freezable_wq instead of the system_wq. This will
> > result in the altmode worker not being scheduled to run until the
> > devices are resumed first, which will give the controllers like I2C a
> > chance to resume before the transfer is requested.
> 
> This is incomplete at best, even as a stop gap. I just threw a
> dump_stack() in qmp_combo_typec_switch_set() and see that it is being
> called four times (don't ask me why) from two different workers on
> hotplug.

Yes, that is expected. From the pmic glink altmode worker and then the
ucsi worker (for the gpio based orientation).

> 
> Even if you use the freezable workqueue for altmode notifications, you
> can still end up here via the ucsi notifications, and that now also
> seems to generate a warning in the PM code during resume.
> 
> [   25.684039] Call trace:
> [   25.686633]  show_stack+0x18/0x24 (C)
> [   25.690492]  dump_stack_lvl+0xc0/0xd0
> [   25.694350]  dump_stack+0x18/0x24
> [   25.697851]  qmp_combo_typec_switch_set+0x28/0x210 [phy_qcom_qmp_combo]
> [   25.704764]  typec_switch_set+0x58/0x90 [typec]
> [   25.709525]  ps883x_sw_set+0x2c/0x98 [ps883x]
> [   25.714092]  typec_switch_set+0x58/0x90 [typec]
> [   25.718861]  typec_set_orientation+0x24/0x6c [typec]
> [   25.724068]  pmic_glink_ucsi_connector_status+0x5c/0x88 [ucsi_glink]
> [   25.730726]  ucsi_handle_connector_change+0xc4/0x448 [typec_ucsi]
> [   25.737099]  process_one_work+0x20c/0x610
> [   25.741322]  worker_thread+0x23c/0x378
> [   25.745274]  kthread+0x124/0x128
> [   25.748680]  ret_from_fork+0x10/0x20
> [   25.753631] typec port4-partner: PM: parent port4 should not be sleeping

Yes, totally missed this one. I guess in the end we could apply the same
fix, considering the alternative of reworking the glink code now.

Or I can just start reworking the glink code now but that is a broader
effort since we will be trying to fix the unconditionally wake-up glink
interrupts as well in one go. And will impact all platforms ...

> 
> When you first brought up the possible workaround of using a freezable
> workqueue, I mistakenly thought this would apply to all glink messages
> (I realise that would defeat the purpose of allowing some early
> notifications).

No, only the altmode worker. In fact, everything stays the same with
respect to the other glink messages as we don't want to break other
clients (hopefully Caleb and Bjorn can describe better the ones that
they know about, IIRC, mobile platforms related).

That was the whole point of doing the altmode only (for now).

But now I'm not sure this is a good idea anymore, since we are starting
to play wack-a-mole if we add ucsi to the list.

> 
> You've also found that the glink interrupts are waking up the system
> unconditionally on battery notifications, which would be yet another
> reason for disabling the interrupts (or implementing some kind of
> masking).

Yes, that is something that needs to be addressed. But IIUC it involves
telling adsp to keep quiet about some notifications, which I don't know
if it's possible and how should be done.

For example, with some chargers, I do get "unknown notification: 0x283"
from the pmic_glink.power-supply and it wakes up from suspend even.

> 
> I'm leaning towards just disabling the glink interrupts during suspend,
> but that depends a bit on what (historical?) functionality actually need
> them.

So the disabling needs to be at least per platform if not per client (or
even notification type). This is what the proper solution discussed with
Bjorn off-list was, IIRC.

> 
> Johan

Thanks for reviewing and reporting this new ucsi case.

Abel

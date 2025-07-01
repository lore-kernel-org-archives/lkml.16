Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71725C838
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751356129; cv=none; b=HZTcOreFVdX3d4YC/v6N+aq+yl5sbVBe9IeoBq02rHsGf7G2ovmFgJHv8dj42KO130aV4OP1WCYQ/L478scn9Tj/VaZXQDC621fw4gssm5xEqrN4c3yJqzGPrTil+najTC7KoLdWDc8/vstPUI2x0niRSsm98C8HtGLZhzxzzAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751356129; c=relaxed/simple;
	bh=yfyVRPQTE8JqiDbaOUKxGFIbx1q4UehpJFGONWIiHbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8PjqG/ZQN8786n8z68PXeB0axaa89Vt4E1KW/u6aO05InlAGJ462snkf/DtykvrwuYr+/tWB72ZAkn8WfUFUi3Asv17dlB9vxDRG0luEMLaJ4nPgXSZNS4h9RnAYWpDEY3AFMzJsO8wRVfNx11pmzFMSNdsVC2kurtmDlcBarA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=D+e37poZ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="D+e37poZ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b31c6c9959cso3694150a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751356127; x=1751960927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEpFKt7YYcFzTPMsl+PrVIXjmxXbTAxWQl834MFcBTI=;
        b=D+e37poZ7ObDomrskbXZhXkWIiOk1YSqbJLLoZ2ZmKkJ2+ovir9J2RiyiV3TqHddtd
         vmQLpXJc0n3GLEqbiupHurA/VHHeXngP7cd59gKljSQBXjxB7g50eakFOL6XfXyIu0Hh
         Fv0ZXr2HPu6s/MYd1HF0eptn/qzHy5Zf6PZIRqMsAn8dffPsz3tbs925t/q0+Qi28kyP
         To/9yTKvAxmaQoydpoytGqEL6TcAN2VZdJX2USXRU1cIqTvZ4Z+NgfxkxFjO8Mp6P4eQ
         AQo7bdpHgopBAhiMsH8P31FixnWEhJrIpNyx1k9ZdKZ87fvr1RdLwJMYtcNwX0mUzuLZ
         R0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356127; x=1751960927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEpFKt7YYcFzTPMsl+PrVIXjmxXbTAxWQl834MFcBTI=;
        b=C3px4xh+IXEEOF5fNKaeuZ7MQj3IcTgWhBDEGj5t4Cl0dDrWM9qGzM+GkRZffqOs/u
         OiHTP5W1luiVOuvJXimkXixlEhBwpu7xWaxfBp7/Yz0dDCdo2c0g/A0RM1cAg9h5wE7z
         nu0x8s4ua39IvNmzmXqXt8VP3uOZfHoH0hpJsNqJGmzmddnLxAPWhqVxqcvK3B3WC62l
         F8vF9XaJZsEuUkGVbmCwSEdPesQvY9T6VzBecfTg6b29epoCm0s8RGGRMexVIbkmF6YH
         u75/53OgisnBAw1dfdRtjzLyivUE2+VaysbGomAMeia53t94WGvr6/s7p6onOWJnSlhT
         a7gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIO9tysm7d/+CpdhI9SzhjiK2v1g+H1qsfNziUdqNk9YWywL1ao9nm8CUZH7i4joNpgIzr44Rpj2tj4SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJywTBdw0MLM2iw13eKUTDVfyE0fhAUMz9+gS4MJZsWXJm00IF
	hAdCwEak320DuyT1Bnq5SC1g1GgYfArxWu8STQlpshs7NvyPxWYxB1eLiIn5wMw6J07M2UhrxjV
	yrhkV70Q=
X-Gm-Gg: ASbGncuaNTVGkf7mtD4cWi3zpif/rJxkuiCXKyGuYaLMDT989AL1IpvNgrtZC4L7J+X
	F+T71XkodPWLp5tEUIuvvQw5iUIGw1z9ar9CmbhtAXnMlYqznHTsUq/In7iLbLEWW65ZoFtlE71
	Dh1oldTZozQq35UNPM7R1IBhWXRSFoCT220/aSjo8XqYxbq2K0KQD1KTsZO9VLDNb2K7SgGiN6p
	b1ypnaM8sCuXMiY85NLNVIrYi1/rheqwCeQEh0uxP4nrh8HDyTS9OW70qkKyaCyq/WqVQu75CJW
	3YtcVapgjCMceMa95HOXVlLOmSJ/HXCuf0H4uiYuNTbbT7XOmnRxBMLsrSamUOXm4xP2MFAfLgF
	CO9SR
X-Google-Smtp-Source: AGHT+IEkSOMFIWuHzTsl3h9jkYp4/Xk30pqD6Wb6IEepi4SrOE2ToSdyXBQqLIMA/PtSl0WH+SMRvA==
X-Received: by 2002:a17:90b:2dd0:b0:312:db8:dbd1 with SMTP id 98e67ed59e1d1-318c8ff231fmr21355546a91.5.1751356127275;
        Tue, 01 Jul 2025 00:48:47 -0700 (PDT)
Received: from [10.74.31.243] ([203.208.189.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c13a16besm10785331a91.14.2025.07.01.00.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 00:48:47 -0700 (PDT)
Message-ID: <f1f68fbd-e2cf-40c5-a6b8-533cb3ec798f@bytedance.com>
Date: Tue, 1 Jul 2025 15:48:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH net] virtio-net: fix a rtnl_lock() deadlock
 during probing
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
 virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250630095109.214013-1-zuozhijie@bytedance.com>
 <20250630103240-mutt-send-email-mst@kernel.org>
 <20250630105328-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zigit Zo <zuozhijie@bytedance.com>
In-Reply-To: <20250630105328-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 10:54 PM, Michael S. Tsirkin wrote:
> On Mon, Jun 30, 2025 at 10:50:55AM -0400, Michael S. Tsirkin wrote:
>> On Mon, Jun 30, 2025 at 05:51:09PM +0800, Zigit Zo wrote:
>>> This bug happens if the VMM sends a VIRTIO_NET_S_ANNOUNCE request while
>>> the virtio-net driver is still probing with rtnl_lock() hold, this will
>>> cause a recursive mutex in netdev_notify_peers().
>>>
>>> Fix it by skip acking the annouce in virtnet_config_changed_work() when
>>> probing. The annouce will still get done when ndo_open() enables the
>>> virtio_config_driver_enable().
>>
>> I am not so sure it will be - while driver is not loaded, device does
>> not have to send interrupts, and there's no rule I'm aware of that says
>> we'll get one after DRIVER_OK.

Yep, at first we're thinking that when the VIRTIO_NET_S_ANNOUNCE flag set,
we can always assure an interrupt has fired by VMM, to notify the driver
to do the announcement.

But later we realized that the S_ANNOUNCE flag can be sent before the
driver's probing, and for QEMU seems to set the status flag regardless of
whether driver is ready, so the problem you're talking still may happens.
>> How about, we instead just schedule the work to do it later?I'm not sure if scheduling the work later will break df28de7b0050, the work
was being scheduled before that commit, and we have no much idea of why that
commit removes the schedule_work, we just keep it for safe...

Then, for plan A, we change the check_announce to schedule_announce, and if
that's true, we do another schedule_work to call virtnet_config_changed_work
again to finish the announcement, like

	if (v & VIRTIO_NET_S_ANNOUNCE) {
		if (unlikely(schedule_announce))
			schedule_work(&vi->config_work);
		else {
			netdev_notify_peers(vi->dev);
			virtnet_ack_link_announce(vi);
		}
	}

>>
>> Also, there is another bug here.
>> If ndo_open did not run, we actually should not send any announcements.
>>
>> Do we care if carrier on is set on probe or on open?
>> If not, let's just defer this to ndo_open?
> 
> Hmm yes I think we do, device is visible to userspace is it not?
> 
> Hmm.  We can keep the announce bit set in vi->status and on open, check
> it and then schedule a work to do the announcement.

Okay, so there's a plan B, we save the bit and re-check it in ndo_open, like

	/* __virtnet_config_changed_work() */
	if (v & VIRTIO_NET_S_ANNOUNCE) {
		vi->status |= VIRTIO_NET_S_ANNOUNCE;
		if (unlikely(!check_announce))
			goto check_link;

		netdev_notify_peers(vi->dev);
		virtnet_ack_link_announce(vi);
		vi->status &= ~VIRTIO_NET_S_ANNOUNCE;
	}

	/* virtnet_open() */
	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_STATUS)) {
		if (vi->status & VIRTIO_NET_S_LINK_UP)
			netif_carrier_on(vi->dev);
		if
		if (vi->status & VIRTIO_NET_S_ANNOUNCE)
			schedule_work(&vi->config_work);
		virtio_config_driver_enable(vi->vdev);
	}

This is a dirty demo, any ideas are welcomed :)

(I think in virtnet_open() we can make the S_LINK_UP being scheduled as well?)

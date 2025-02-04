Received: from chocolate.ash.relay.mailchannels.net (chocolate.ash.relay.mailchannels.net [23.83.222.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B3C207DE5;
	Tue,  4 Feb 2025 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738665076; cv=pass; b=uQgQwbOuZCyk/wFNIvqo4C6BvL/v7MgqNfDHlScOWbMGgVyLbNuNRVVwjXF7yFT+QFLXs/9bkVUMR5Gje/XLktvnq+r/b3IrSus9wE+DxSYsW/oLAXPfhWrGsyh3tf97dQt1VF64FYfcdGgVud12w3PhJnaF+D+p9p5Ecxncx3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738665076; c=relaxed/simple;
	bh=aHQkphcwenG14et1NLQ6GgobnEaek4IdQVsuk6RuE1Y=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=fPtQ0aW9A8AmKZgdt54fLZkyqk8yDjAJDarN6YsJiYA0BRNtftYidfuppSpa8Ak1QvQhuTHoTGERox6eEzrZC22reudKvntaxOLgA+s435lzF4/mnmvhtV+0krdhyZAw7J+wXajmvPWzau/lXw29aU4jz71rRUYpBLiNDLhwewg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com; spf=pass smtp.mailfrom=arinc9.com; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=mkrRrEO0; arc=pass smtp.client-ip=23.83.222.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="mkrRrEO0"
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BA19E7834FC;
	Tue,  4 Feb 2025 09:15:16 +0000 (UTC)
Received: from fr-int-smtpout9.hostinger.io (trex-3.trex.outbound.svc.cluster.local [100.119.13.85])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2AB007834B4;
	Tue,  4 Feb 2025 09:15:07 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738660516; a=rsa-sha256;
	cv=none;
	b=7YsnCF37Zpl/iZ75sKvsVV2E+WiBxSgx0k9VD+fhxgvshhlV577hcPLs7VpR6TanrwHQaG
	tRk9gpivYmRcq7y3WJCwrNZAAzQaUj+sG860hTlffcg/kfJhTBvPHDnOc3iKzu4j0D4iPa
	QENUYvpbQTChgWMMdHyYRBCMByMH+zfiyYPaPGsbQf1eoKSRYctnkYici+h6lfWbqyysEI
	toCFvnjO1+rWoRtLXaEJdyi5mdYkVNNigUyNCXsjfzEr9XVUqGTWqrNAvd7YMsJLMcph+S
	4TN5u4yHvhOFebljggmPfYTLr6yBwJmlb35R9e28NzpWqPljHcQ68R1HJk6LJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738660516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=RaWO/kSRk7tPQ5rv92NyL8uzPM+neCel3leFvmNy4iA=;
	b=gZJtcvrJdYHAlLI/IDUdN6ZtH4+dTcpF9wNR1yrG5Qx0YDx6IYB8jnYidRHEtLxxnse1ks
	/aYSv5rKbz7auSKlYFY4OOctTVsQVfZ6q3TLpA1HhiYh1lRNTi0NvGuEVWHHQDtTT/xjvS
	wqB5Owl+VNJNrp+grRRUtiZ/FDwpgx/yIbEyS5DcsgTGng7PIqE5lDoVsykzMw/ad48ELC
	2MjwaQMr3iAy3amHAafc7a3iDdLUEhW0/Ad31FFTZDxSGMX17kpNTOCxYqdfAuONsOHTFy
	eemNagodKCsueQnRtkEn006SY0CR/0s0teziH4Y1s0EtqGlMVI5GB4noAE/Z2Q==
ARC-Authentication-Results: i=1;
	rspamd-854f7f575d-2jbtq;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=chester.a.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Broad-Ski: 76fd89c70b0b489d_1738660516524_3124665043
X-MC-Loop-Signature: 1738660516524:848083543
X-MC-Ingress-Time: 1738660516524
Received: from fr-int-smtpout9.hostinger.io (fr-int-smtpout9.hostinger.io
 [89.116.146.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.119.13.85 (trex/7.0.2);
	Tue, 04 Feb 2025 09:15:16 +0000
Message-ID: <6e2c4db7-1325-473b-9999-2b1ada418119@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1738660505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RaWO/kSRk7tPQ5rv92NyL8uzPM+neCel3leFvmNy4iA=;
	b=mkrRrEO0Na0QYjX9WJgXoWOixUlaSxD6LBRo3nn+3929v+xK26TNEi2/vI6Hy1D8Zt9u0B
	jdQ+I+qhzOs2L4QVSEeqYYd3PeUcgrmWL9VjX++YTgm3Fp4StTaZgouUsCaPGx90h7cJ7z
	Wk0FGKbaHw7OhB85nswpbXEUB9VyE6KnrW38s+uB2hpizD0r/Qeq0m5ZVR8WtrgmICY/lw
	iPMmv0FJ4UXBY1VodKtLZtTLTwuIrgn/UWZMcBGpogXFpgJGW+zU9c3ku+WUzYmmw//cNo
	/1ULsP8JiOmXV/027TlN44gkAbq5gvSsiQ9cF/iG7DpQqkKczdGtMsQ5kQ+Nog==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: serial: option: add MeiG Smart SLM828
To: Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dwayne Du Preez <dwayne.dupreez@xpedite-tech.com>,
 Alexander Scholten <alexander.scholten@xpedite-tech.com>,
 Zenon van Deventer <zenon@xpedite-tech.com>
References: <20250124-for-johan-meig-slm828-v2-1-6b4cd3f6344f@arinc9.com>
Content-Language: en-US
From: "Chester A. Unal" <chester.a.unal@arinc9.com>
In-Reply-To: <20250124-for-johan-meig-slm828-v2-1-6b4cd3f6344f@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 04 Feb 2025 09:15:02 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a1da99 a=xK2r8zoKF9vSrBIo2YuqYg==:117 a=xK2r8zoKF9vSrBIo2YuqYg==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=GvHEsTVZAAAA:8 a=_f8JpNa6bwX4ccdNp18A:9 a=QEXdDO2ut3YA:10 a=aajZ2D0djhd3YR65f-bR:22
X-CM-Envelope: MS4xfJl9j181SPdF3rdTbprP1LqaZ7yWxVIZGzj+nsmZnSlLJTa3tqwkU+pPnLXHsfW8IH6lrpGTIiZFCPk1XKuxzXbS+xpMVIvng49Vy15M93X/obAfLceI qvdXhV+VOnS1NWtMo3YSkRhC1MuscT77aY0LqRDGWavmHHbycz1aMVMQHcaDQ0VZ7zzZBJSbrf4+cNtrEI7dAqKKTlxLDxMFYHPamNyqIOkkXyUc92iYGtbb AcANdtJhHei7fa/YjeGKxkvmuQjiDvK7gf/asOCxPIhAlGjUD9VLKFLa2aChSksvS6weGeWkE0Lvlm5cJ2RUAWn0QZI6p4aS0bY1eiZMX9UvDzI4tJgV1PpV l83C01bv6+h3jNlXMX72Wgp1IbiiLDtXQFJxf9XN1st/l+fSKaXAHh5pv9tTmVDkJi2piq9SYL0Hc0qREtr6cgE/y61B5UK/v+3gjOLgxl9vSBp5ilM=
X-AuthUser: chester.a.unal@arinc9.com

Hello.

A reminder for this patch to be applied.

Chester A.

On 24/01/2025 10:28, Chester A. Unal via B4 Relay wrote:
> From: "Chester A. Unal" <chester.a.unal@arinc9.com>
> 
> MeiG Smart SLM828 is an LTE-A CAT6 modem with the mPCIe form factor. The
> "Cls=ff(vend.) Sub=10 Prot=02" and "Cls=ff(vend.) Sub=10 Prot=03"
> interfaces respond to AT commands. Add these interfaces.
> 
> The product ID the modem uses is shared across multiple modems. Therefore,
> add comments to describe which interface is used for which modem.
> 
> T:  Bus=01 Lev=01 Prnt=05 Port=01 Cnt=01 Dev#=  6 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2dee ProdID=4d22 Rev=05.04
> S:  Manufacturer=MEIG
> S:  Product=LTE-A Module
> S:  SerialNumber=4da7ec42
> C:  #Ifs= 6 Cfg#= 1 Atr=80 MxPwr=500mA
> I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=10 Prot=01 Driver=(none)
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=02 Driver=(none)
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=03 Driver=(none)
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=04 Driver=(none)
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=05 Driver=qmi_wwan
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=89(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Chester A. Unal <chester.a.unal@arinc9.com>
> ---
> $ lsusb -v
> 
> Bus 001 Device 006: ID 2dee:4d22 MEIG LTE-A Module
> Negotiated speed: High Speed (480Mbps)
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               2.10
>    bDeviceClass            0 [unknown]
>    bDeviceSubClass         0 [unknown]
>    bDeviceProtocol         0
>    bMaxPacketSize0        64
>    idVendor           0x2dee MEIG
>    idProduct          0x4d22 LTE-A Module
>    bcdDevice            5.04
>    iManufacturer           1 MEIG
>    iProduct                2 LTE-A Module
>    iSerial                 3 4da7ec42
>    bNumConfigurations      1
>    Configuration Descriptor:
>      bLength                 9
>      bDescriptorType         2
>      wTotalLength       0x00e1
>      bNumInterfaces          6
>      bConfigurationValue     1
>      iConfiguration          4 DIAG_MODEM_AT_NMEA_ADB_RMNET
>      bmAttributes         0x80
>        (Bus Powered)
>      MaxPower              500mA
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass       255 Vendor Specific Class
>        bInterfaceSubClass     16 [unknown]
>        bInterfaceProtocol      1
>        iInterface              0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x01  EP 1 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x81  EP 1 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        1
>        bAlternateSetting       0
>        bNumEndpoints           3
>        bInterfaceClass       255 Vendor Specific Class
>        bInterfaceSubClass     16 [unknown]
>        bInterfaceProtocol      2
>        iInterface              0
>        ** UNRECOGNIZED:  05 24 00 10 01
>        ** UNRECOGNIZED:  05 24 01 00 00
>        ** UNRECOGNIZED:  04 24 02 02
>        ** UNRECOGNIZED:  05 24 06 00 00
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x83  EP 3 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x000a  1x 10 bytes
>          bInterval               9
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x82  EP 2 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x02  EP 2 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        2
>        bAlternateSetting       0
>        bNumEndpoints           3
>        bInterfaceClass       255 Vendor Specific Class
>        bInterfaceSubClass     16 [unknown]
>        bInterfaceProtocol      3
>        iInterface              0
>        ** UNRECOGNIZED:  05 24 00 10 01
>        ** UNRECOGNIZED:  05 24 01 00 00
>        ** UNRECOGNIZED:  04 24 02 02
>        ** UNRECOGNIZED:  05 24 06 00 00
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x85  EP 5 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x000a  1x 10 bytes
>          bInterval               9
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x84  EP 4 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x03  EP 3 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        3
>        bAlternateSetting       0
>        bNumEndpoints           3
>        bInterfaceClass       255 Vendor Specific Class
>        bInterfaceSubClass     16 [unknown]
>        bInterfaceProtocol      4
>        iInterface              0
>        ** UNRECOGNIZED:  05 24 00 10 01
>        ** UNRECOGNIZED:  05 24 01 00 00
>        ** UNRECOGNIZED:  04 24 02 02
>        ** UNRECOGNIZED:  05 24 06 00 00
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x87  EP 7 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x000a  1x 10 bytes
>          bInterval               9
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x86  EP 6 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x04  EP 4 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        4
>        bAlternateSetting       0
>        bNumEndpoints           1
>        bInterfaceClass       255 Vendor Specific Class
>        bInterfaceSubClass    255 Vendor Specific Subclass
>        bInterfaceProtocol    255 Vendor Specific Protocol
>        iInterface              6 GPS
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x88  EP 8 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               9
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        5
>        bAlternateSetting       0
>        bNumEndpoints           3
>        bInterfaceClass       255 Vendor Specific Class
>        bInterfaceSubClass     16 [unknown]
>        bInterfaceProtocol      5
>        iInterface              7 RmNet
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x89  EP 9 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0008  1x 8 bytes
>          bInterval               9
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x8e  EP 14 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x0f  EP 15 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
> Binary Object Store Descriptor:
>    bLength                 5
>    bDescriptorType        15
>    wTotalLength       0x0016
>    bNumDeviceCaps          2
>    USB 2.0 Extension Device Capability:
>      bLength                 7
>      bDescriptorType        16
>      bDevCapabilityType      2
>      bmAttributes   0x0000211e
>        BESL Link Power Management (LPM) Supported
>      BESL value      256 us
>      Deep BESL value     8192 us
>    SuperSpeed USB Device Capability:
>      bLength                10
>      bDescriptorType        16
>      bDevCapabilityType      3
>      bmAttributes         0x00
>      wSpeedsSupported   0x000f
>        Device can operate at Low Speed (1Mbps)
>        Device can operate at Full Speed (12Mbps)
>        Device can operate at High Speed (480Mbps)
>        Device can operate at SuperSpeed (5Gbps)
>      bFunctionalitySupport   1
>        Lowest fully-functional device speed is Full Speed (12Mbps)
>      bU1DevExitLat           0 micro seconds
>      bU2DevExitLat           0 micro seconds
> Device Status:     0x0000
>    (Bus Powered)
> ---
> Changes in v2:
> - Add to the relevant comment that SLM828 is based on Qualcomm SDX12.
> - Add to the comment for certain interface specification that SRM815
>    uses that interface specificiation as well.
> - Link to v1: https://lore.kernel.org/r/20250123-for-johan-meig-slm828-v1-1-6456996e94a5@arinc9.com
> ---
>   drivers/usb/serial/option.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 1e2ae0c6c41c79dd38f2c1d3a98e58ebf076050a..1f324ef877722be246523d2f8a25b8550dc9bb97 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -621,7 +621,9 @@ static void option_instat_callback(struct urb *urb);
>   
>   /* MeiG Smart Technology products */
>   #define MEIGSMART_VENDOR_ID			0x2dee
> -/* MeiG Smart SRM815/SRM825L based on Qualcomm 315 */
> +/* MeiG Smart SLM828, SRM815, and SRM825L use the same product ID. SLM828 is
> + * based on Qualcomm SDX12. SRM815 and SRM825L are based on Qualcomm 315.
> + */
>   #define MEIGSMART_PRODUCT_SRM825L		0x4d22
>   /* MeiG Smart SLM320 based on UNISOC UIS8910 */
>   #define MEIGSMART_PRODUCT_SLM320		0x4d41
> @@ -2405,10 +2407,12 @@ static const struct usb_device_id option_ids[] = {
>   	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SLM320, 0xff, 0, 0) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SLM770A, 0xff, 0, 0) },
> -	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0, 0) },
> -	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0xff, 0x30) },
> -	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0xff, 0x40) },
> -	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0xff, 0x60) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0, 0) },	/* MeiG Smart SRM815 */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0x10, 0x02) },	/* MeiG Smart SLM828 */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0x10, 0x03) },	/* MeiG Smart SLM828 */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0xff, 0x30) },	/* MeiG Smart SRM815 and SRM825L */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0xff, 0x40) },	/* MeiG Smart SRM825L */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0xff, 0x60) },	/* MeiG Smart SRM825L */
>   	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),			/* TCL IK512 MBIM */
>   	  .driver_info = NCTRL(1) },
>   	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */
> 
> ---
> base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
> change-id: 20250123-for-johan-meig-slm828-cb38669db37c
> 
> Best regards,


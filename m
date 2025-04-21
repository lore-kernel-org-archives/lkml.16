Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167D191F7F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745218080; cv=none; b=Yj1IbKV4BFNnHE+ZShZNe+MYfZ9dEgFJrbg4GfcXwN22rRTrFTDET2XfRMBOU7xi7jG0H1zyX+/bJzTLpcMfbgvUTkfCNeIk5+lknEyCLIfIho/T/Uv8BERlrLu9tMTK407wzpUIluYay+QYTnKdYPWNJdtOx/er8ssVI8SLH8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745218080; c=relaxed/simple;
	bh=nL88osFR+xwkq0d89jaqv2lpr1Vg52plmkAJMPjBbWM=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=KdIn28QNpkQUBygl303KWuW1bvT19y8UeacQzNtS2HtTAiRG+Szy489xckYx7dEh1+y/bye9XWEk+uJE6wL91dOSCJ8AWSbgBF7Xd/rmgVhBTFauqAekeM98AUoVJa7XHOYH63YYXomWFh68RuHXKWIDIkRebu0ZrZSfEp8Ayqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IMo00jIS; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IMo00jIS"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abbd96bef64so615543166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 23:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745218077; x=1745822877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoh+UHAHaX63W3Xnorvqri+MwqtBlKW14ThZ2I5rFOc=;
        b=IMo00jIS7OWhR4nTJE9WCVXlHUK/0pp9NWzyPZXnhtBKZD0qavZFNVYClXoJmy1LCB
         gnhjLe3fLBzTdOZN1IWW+Z2kM9MuxwwsyV8M1qAhpXkpYUo8EyE96Cj2aZ7ydRbAR1uv
         zi9mbfJxypcXyGgSqkDCiLAtI/VGGPbe3yQv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745218077; x=1745822877;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eoh+UHAHaX63W3Xnorvqri+MwqtBlKW14ThZ2I5rFOc=;
        b=f+77OfYUBT/cXIsTuHrQqEU/+5RCoJti2CCfCbmYFUnqNXHZmwAwHrgwKkO6Gzayr5
         wcp2RsZpWTUq1IEXKUfVOJ+7LHE0mjwqoegPz2ixSM5n9ABIP/+iRUfb2v6g1OfPFvuR
         84YvesjsbUqOIJvPzMgXfYbb7LdwNvuxaG0EE3eUrxiNnyfWXVZkY/sp/9+MYNVR+CdG
         nEBOI1UIVYpv39m/BiO+/+qhX1DbY1vVnsHeXKhvPIaaO0IvIugFBHy0HWiw7MTlz2yb
         8BUEwVDmHOHfjYfcbvqMEi/okjyA46BOTdBt4BMbukdxfxkxmZQ7euh41J8vwewGAV/5
         Jkng==
X-Forwarded-Encrypted: i=1; AJvYcCWQvJDUJtdnVNpFfDSMfuEsPbzdZ/cCG7rRH5VZb9V1FJZtloJ8ckSKtF9i1j3lsWBd4fvwg+JCXzbBLh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmpC3lJ+79rVdUqbjDDMDQVz0wNDgj65guUYid7nqhCs+lMnk2
	huaCF+EeG7lbXWRV+MK4EIO9BYPKuecNM8SOgsFKzVykScLRCExPHCnEZPMvDQ==
X-Gm-Gg: ASbGnctv5IdKMPYDGZrUdgO4/fe5QOeg5xnZOqxg+S350ZwQjFS7SxnyHYOQcSfhsfs
	vl2ryxL+LdLjMYgwzA2TBT3jl4839KwbwnVWsw9paf0dGoMEu4dE5rXqrLa86Ryejtm7EEHkkfL
	44BD36eq8M0cR2//CaOgme7gXrxy9PDJElTz3Q/oq3SvF3iMGqiTbbd0l6b4ZT/mYOW3OHzyuFz
	SutPPNzCsuMMeAoRIpOoY5uS2rsgPl5XMrKtT4og96eDK+Ud1buijctORNtzaZDGRwlCBGCjD1/
	ZL0VMD8oy83Fszx8cF8K5sMukjNZtsArJZuMPlcxmD8HqRR7YpRlzN+zf/xwvXXCClTf9+sFxkA
	P07A=
X-Google-Smtp-Source: AGHT+IF57sTzG2W/MLUToUBMdG3Gp8wae1dAx1ppKQWPBR7VB+1fvf1xtyMNBtv0qPDtnlesQOYTmA==
X-Received: by 2002:a17:907:9622:b0:aca:df11:c53c with SMTP id a640c23a62f3a-acb74dbb5admr911534466b.43.1745218076812;
        Sun, 20 Apr 2025 23:47:56 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec04819sm479666666b.10.2025.04.20.23.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 23:47:56 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: KeithG <ys3al35l@gmail.com>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Mon, 21 Apr 2025 08:47:56 +0200
Message-ID: <196571a7d60.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CAG17S_NDLjfeTZ_qo8B6aXi2z6BHYCakBHzy2AqcqP2Co32hNw@mail.gmail.com>
References: <20250407042028.1481-1-vulab@iscas.ac.cn>
 <CAG17S_NDLjfeTZ_qo8B6aXi2z6BHYCakBHzy2AqcqP2Co32hNw@mail.gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: Cannot maintain an ap with brcmfmac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 20, 2025 8:15:56 PM KeithG <ys3al35l@gmail.com> wrote:

> Group,
>
> I do not really know what has changed, but I

Can you try to find out?

> can no longer maintain an
> ap runnning with brcmfmac on my Pis with the brcmfmac43455 chip. The
> firmware is current (and ahead of what RPiOS ships):

Maybe you could try with what RPiOS ships.

> [    3.472501] brcmfmac: F1 signature read @0x18000000=0x15264345
> [    3.493274] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43455-sdio for chip BCM4345/6
> [    3.494583] usbcore: registered new interface driver brcmfmac
> [    3.900038] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob
> available (err=-2)
> [    3.901161] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6
> wl0: Oct 28 2024 23:27:00 version 7.45.286 (be70ab3 CY) FWID
> 01-95efe7fa
>
> I get this with the default RPiOS verison of hostapd:
> # hostapd -v
> hostapd v2.10
> User space daemon for IEEE 802.11 AP management,
> IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
> Copyright (c) 2002-2022, Jouni Malinen <j@w1.fi> and contributors
>
> And also with the one I built from source. The latest hostapd I could find.
> The git repo it is built from is from here: https://w1.fi/hostapd/
>
> # hostapd -v
> hostapd v2.11-hostap_2_11+
> User space daemon for IEEE 802.11 AP management,
> IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
> Copyright (c) 2002-2024, Jouni Malinen <j@w1.fi> and contributors
>
> My hostapd.conf is:
> # cat /etc/hostapd/hostapd.conf
> # interface and driver
> interface=ap0
> driver=nl80211
>
> ht_capab=[HT40][SHORT-GI-20][DSSS_CCK-40]
>
> # WIFI-Config
> ssid=TestAP
> channel=6
> hw_mode=g
> wmm_enabled=1
> macaddr_acl=0
> auth_algs=1
> max_num_sta=10
>
> # WIFI authorization
> wpa=2
> wpa_key_mgmt=WPA-PSK
> wpa_pairwise=TKIP CCMP
> rsn_pairwise=CCMP
> wpa_psk_radius=0
> wpa_passphrase=secret123
>
> If there is something wrong in my setup, let me know.

Hard to tell. The above looks okay, but no idea what your setup looks like.

> when I start hostapd with dnsmasq, an interface comes up and I can
> connect. As soon as it connects, it disconnects:
> Apr 20 12:57:39 pi4 systemd-networkd[181]: ap0: Gained carrier
> Apr 20 12:57:39 pi4 dnsmasq[169728]: started, version 2.90 cachesize 150
> Apr 20 12:57:39 pi4 dnsmasq[169728]: compile time options: IPv6
> GNU-getopt DBus no-UBus i18n IDN2 DHCP DHCPv6 no-Lua TFTP conntrack
> ipset nftset auth cryptohash DNSSEC loop-detect inotify dumpfile
> Apr 20 12:57:39 pi4 dnsmasq[169728]: warning: interface ap0 does not
> currently exist

So does this mean you run with two wifi interfaces, ie. wlan0 and ap0? Can 
you try with just only an AP interface?

> Apr 20 12:57:39 pi4 dnsmasq-dhcp[169728]: DHCP, IP range 192.168.5.2
> -- 192.168.5.254, lease time 1d
> Apr 20 12:57:39 pi4 dnsmasq[169728]: reading /run/systemd/resolve/resolv.conf
> Apr 20 12:57:39 pi4 dnsmasq[169728]: using nameserver 192.168.2.253#53
> Apr 20 12:57:39 pi4 dnsmasq[169728]: read /etc/hosts - 8 names
> Apr 20 12:57:39 pi4 hostapd[169681]: ap0: interface state 
> UNINITIALIZED->ENABLED
> Apr 20 12:57:39 pi4 hostapd[169681]: ap0: AP-ENABLED
> Apr 20 12:57:39 pi4 resolvconf[169735]: Dropped protocol specifier
> '.dnsmasq' from 'lo.dnsmasq'. Using 'lo' (ifindex=1).
> Apr 20 12:57:39 pi4 resolvconf[169735]: Failed to set DNS
> configuration: Link lo is loopback device.
> Apr 20 12:57:39 pi4 systemd[1]: Started dnsmasq.service - dnsmasq - A
> lightweight DHCP and caching DNS server.
> Apr 20 12:57:40 pi4 kernel: brcmfmac: brcmf_cfg80211_set_power_mgmt:
> power save disabled
> Apr 20 12:57:48 pi4 kernel: ieee80211 phy0: brcmf_escan_timeout: timer expired
> Apr 20 12:57:48 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: associated
> Apr 20 12:57:48 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: associated
> Apr 20 12:57:48 pi4 hostapd[169681]: ap0: AP-STA-CONNECTED 50:84:92:a6:7a:7a
> Apr 20 12:57:48 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a
> RADIUS: starting accounting session 4336779F2221A786
> Apr 20 12:57:48 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a WPA:
> pairwise key handshake completed (RSN)
> Apr 20 12:57:48 pi4 hostapd[169681]: ap0: EAPOL-4WAY-HS-COMPLETED
> 50:84:92:a6:7a:7a
> Apr 20 12:57:48 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a
> RADIUS: starting accounting session 4336779F2221A786
> Apr 20 12:57:48 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a WPA:
> pairwise key handshake completed (RSN)

So looks like connection and security are setup correctly...
> Apr 20 12:57:48 pi4 dnsmasq-dhcp[169728]: DHCPDISCOVER(ap0) 50:84:92:a6:7a:7a
> Apr 20 12:57:48 pi4 dnsmasq-dhcp[169728]: DHCPOFFER(ap0) 192.168.5.214
> 50:84:92:a6:7a:7a
> Apr 20 12:57:48 pi4 dnsmasq-dhcp[169728]: DHCPREQUEST(ap0)
> 192.168.5.214 50:84:92:a6:7a:7a
> Apr 20 12:57:48 pi4 dnsmasq-dhcp[169728]: DHCPACK(ap0) 192.168.5.214
> 50:84:92:a6:7a:7a

...and DHCP exchange is okay, which clearly indicated encrypted data 
connection is working.

> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: disassociated
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: AP-STA-DISCONNECTED 50:84:92:a6:7a:7a
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: disassociated
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: disassociated
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: disassociated
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: disassociated
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: disassociated

So not clear what triggers these disassociated events. Can you enable debug 
prints in brcmfmac, ie. use debug=0x100400? The levels are defined in 
debug.h [1]

> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: associated
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: associated
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: AP-STA-CONNECTED 50:84:92:a6:7a:7a
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a
> RADIUS: starting accounting session 33CFF844DBBE630F
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a WPA:
> pairwise key handshake completed (RSN)
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: EAPOL-4WAY-HS-COMPLETED
> 50:84:92:a6:7a:7a
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a
> RADIUS: starting accounting session 33CFF844DBBE630F
> Apr 20 12:57:52 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a WPA:
> pairwise key handshake completed (RSN)
> Apr 20 12:57:52 pi4 dnsmasq-dhcp[169728]: DHCPDISCOVER(ap0) 50:84:92:a6:7a:7a
> Apr 20 12:57:52 pi4 dnsmasq-dhcp[169728]: DHCPOFFER(ap0) 192.168.5.214
> 50:84:92:a6:7a:7a
> Apr 20 12:57:52 pi4 dnsmasq-dhcp[169728]: DHCPREQUEST(ap0)
> 192.168.5.214 50:84:92:a6:7a:7a
> Apr 20 12:57:52 pi4 dnsmasq-dhcp[169728]: DHCPACK(ap0) 192.168.5.214
> 50:84:92:a6:7a:7a
> Apr 20 12:57:57 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: disassociated
> Apr 20 12:57:57 pi4 hostapd[169681]: ap0: AP-STA-DISCONNECTED 50:84:92:a6:7a:7a
> Apr 20 12:57:57 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: disassociated
> Apr 20 12:57:57 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: disassociated
> Apr 20 12:57:57 pi4 hostapd[169681]: ap0: STA 50:84:92:a6:7a:7a IEEE
> 802.11: disassociated
> Apr 20 12:58:11 pi4 hostapd[169681]: ap0: interface state ENABLED->DISABLED
> Apr 20 12:58:11 pi4 systemd[1]: Stopping hostapd.service - Hostapd
> IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator...

Assuming it is stopped manually here. Correct?

Regards,
Arend

[1] 
https://elixir.bootlin.com/linux/v6.14.3/source/drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.h



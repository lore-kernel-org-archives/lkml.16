Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC6F1E130F
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 23:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739142669; cv=none; b=ItR8xErGRo68mSHJI+hfy/c0Nu3qN9ODwo/qBcb5m7TxuEQ0Lp4iwVmGFwqo3ZYhpcYlaTUp+cg5htjXqyse95V/oehdVZr7SdfvHPAw4p8ysfI0ZCloAKEQwXReXN2LK823oIswJZ8Dc509KgTnl+RaA/NV1KIl0M51GSzz+aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739142669; c=relaxed/simple;
	bh=LIsEOvGJI+uoC3MkU9OIroq6AT4zBmXTw6Rco3onVSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TByEeIcgP+E6bnf+y1t8hzjMNPVAcFTbyqHjD6BWfsD/BkvfKM6HfFR69yDpmjiStPfYmZUaM20aLcxodc1FixGLgs5+Otvjzruh3UPhKFqXlbPKQRDJsq4YC3YoyyEMiGJDB8dk+S5kd95m9sJ7TnFDNtjCHJhmNy5lut6+q60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=MUdmDveM; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="MUdmDveM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739142657; x=1739747457; i=spasswolf@web.de;
	bh=DOgsJLDk0dTZZvVhtM6zKQYuU5P+hgiAsngavCjdeAo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MUdmDveMfh+jy9F6c52L/p0gU0QqpP9U96HrFC4ULpnujQZvlCNXFheiZe9qHLe2
	 mddRRFWtMGrH+oGIlOAgmonT58Y9dSVjBcfp7ndooOlK82qypfdDdh0zIIdc4+VCP
	 g28A5vXOOZD94cFASBUFixvXZcbxxG0qmN8gEvkrwMCmq8FpLH4XK+Bj7PKU9lyI0
	 kf1tBmFavgi3tL2K2ttJg5UwUTPs21XDcq9/FLpwug7UTTsMnKIh8HXOCtF/IIDP9
	 sF8L811H4s5yGQNwcckBkCbzJXV/C0bPL91375oI34kUPWpKPdEwJsFK0nRfeG3oI
	 XYe8ZdUj6AFqgEz5Lw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MdwNg-1t9qdz1IYA-00m1e2; Mon, 10 Feb 2025 00:10:57 +0100
From: Bert Karwatzki <spasswolf@web.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>
Subject: wcd9335 efuse sensing fails on fairphone-fp3
Date: Mon, 10 Feb 2025 00:10:52 +0100
Message-ID: <20250209231054.390922-1-spasswolf@web.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m8ETLs2F3KcEu04F3XF2xqrHgTc7PmoSHLgdGKsj0NJNiyrD9GR
 hsIazgFRIb+crs5/z5U3KCsjueDmGC6pQseVeoIj/fbQ4Wh/K9lvtlcjlwhYgQzoIu9QQyY
 v7OJikmvP39/xz2tQllvUq7ohQx4wqHC8UAbL1+0D7GktAkEnrRZnBxtF3RTAH9N3vxgTLN
 uM6wyiSX0FpDSDA9/5E9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OQmZKYURTGs=;w8BakEYocS1QqLGlBho2A8z1t1b
 fAXtHnPX9GGHRU2OtQeXOKmztKwgo1LutSrdnNTxzGDP/xHg55vAvvZOUI5i98ugvyVOVj64u
 7OPjUL2V6co5C9RO6hHDTmsqk2i2bAplvwMWmUosHnPc6st/Ulruo/WqQ6v0yNu9p9Hwq3B+j
 TfNV/NFTV+MOCKOjeIzH+yKYfTp+ee/YX5yDFRVRWo8m2V72cWrlTyPEQ9ac3l3JE9l/ogkFC
 qm4zwyAs1tWwI8X7g9pPTDasSvT5wqcBQvOkyrtHLPblRDrtDYFMGYn9tGndR6GxlFD+bWvEY
 b1BeYsybbRxVxrte84kaoDCR8M3dmTjl/RDWX3nMJM+3dnSNCxDMaDXwQXx6SP3n4F76xcEZ1
 oQJaGUSx37NjDz7eT4KkmBYhGO+clWYfZGiCZvdbc2li1ncetJEoyaZckOvro9rJhXem4GIBQ
 U7j0M7CPnp+I7Eq+uMpw5y0F+QjOqKQMc//yVlw2C4Ucuv1pKXgxWzAnin+SfKnRhFIiJIJdv
 X6Aaxo7arABa6b02d5ba+0hCHWNPew4foOHQgnhPPT++ocC9aWGiIi9s9XNz/LTx4E2Zk10st
 BpC8DQk3SvaFqrxyaBGnUUMkMwrnAER09EgyGaxKTom23GyorOFRQzy0Lfo01ElCls5WGA/7E
 JgkVUl+5QFy+u69BCMzeoCJv2zhKzgTrekqcc2bQ7XkZwcvq/6DwGSAfHC57Oqx6KEMbrAZKr
 7DQAhd303qN9f+ZiYtvaZsc4fosIYJvdmUyiTf37iM1S9pIifKz1bO7TQ+7WIvpDVnFzWiVw3
 MZxzCkaDtc0/IAqrvt8lPf47FNr31uOb9m3nmtukVsqWcqPuCVRtLkeb0iUwK/cnBddfSMhzc
 vW1FTfJt32hmzKXAPlRmzh9eaRSvecbcIh1HDp8CYdqx2bDj0wl9Uq8MGcmRH7VvGhCABfV19
 qzwTHwA3gMCP9gm3kX9JwrDHYO7UGngwLpoOwC6V3ImXndr/GjOf5dpFuKvWlGsckYt0zlErW
 xJwd8SYedyTEc5NxG2mhg9D6pc+Bl2afU+0nHPzUSp4RWnkj3KIiHOqBQm0Y/8tJQByK45NY7
 ipFTyzNd20WAs5jbizKPBrRBcRRA/ltt6yKrztXk6DLnK4Z7D2QuUdZRVyerZy+zyEzgQ5Ayt
 887wrJbmMF1k3u4WU/yzDAZ37NMV0VyNYh3MWk0lG3FRoN8WN/1ERiG+Y4GMb+yGrtbK2ktMR
 2l4NEe6SxBsviXoqV8N2ESRqCxvz9Xxtgal7V8W+Evkb7PfF5klB/c51gALbRZCRI+S5bIbbu
 xb0/Xhb9t/IEqR/dDLOrpl+8kc+utP3UN8nk6YCbVSeWCN+/MZu0wc9Ky5wyHp0Je5Q3BXdBP
 eS/M+QmDEWDPMKVc2QmgE1uTurGxrVCLo7Y6rKnNaR4HdDn2VbiqXXPfM2IdnIJZU8HyJgi6F
 8nUFW8hjuJLPOKrTpakWSNEy8IY0=

I recently tried to use the wcd9335 codec driver on the fairphone-fp3
with a close to mainline kernel from here
https://github.com/msm8953-mainline/linux/

After I get a logical address for the wcd9335 slim device the setup
seems to work until it reaches wcd9335_enable_efuse_sensing(),
where I get the warning message from

if (!(snd_soc_component_read(comp,
				WCD9335_CHIP_TIER_CTRL_EFUSE_STATUS) &
				WCD9335_CHIP_TIER_CTRL_EFUSE_EN_MASK))
	WARN(1, "%s: Efuse sense is not complete\n", __func__);

After this I get  a lot of slim interrupt errors (it seems every slim writ=
e fails):

[    8.779992] qcom,slim-ngd-ctrl c140000.slim: Error Interrupt received 0=
x82000000
[...]

I tested the effect of not enabling efuse sensing on kernel 4.9.218 (the f=
airphone-fp3
downstream kernel with ubuntu touch) and also got lots of the same slim in=
terrupt errors:

[   42.863981] NGD interrupt error:0x82000000, err:-5
[   42.863996] err desc[0]:0x8c86806
[   42.863997] err desc[1]:0x680
[   42.863999] err desc[2]:0x0
[   42.864000] err desc[3]:0x0
[   42.864001] err desc[4]:0x0
[   42.864003] err desc[5]:0x0
[   42.864004] err desc[6]:0x0
[   42.864005] err desc[7]:0x0
[   42.864007] err desc[8]:0x0
[   42.864024] err desc[9]:0x0
[   42.864024] TX failed :MC:0x68,mt:0x0, ret:-5, ver:261
[   42.864035] conf:0x7,stat:0x684840e,rxmsgq:0x10000
[   42.864039] int_stat:0x0,int_en:0xbe000000,int_cll:0x0
[...]

So I now believe that not enabling efuse sensing for wcd9335 causes the
slim interrupt errors. Does anybody have an idea what could have caused
the efuse sensing failure?

Bert Karwatzki


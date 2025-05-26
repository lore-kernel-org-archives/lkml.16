Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF2D433AC;
	Mon, 26 May 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269234; cv=none; b=TXqDjTMlBTOOsXty6Z/ZINjaFNWWgk+/OVczhdyveoFyB8uwUOfAfSE2Zeb6kLrZBjGCQQBRGs/ug32YNMO3uMXT2cB8H3PwYaRK4R1QRXCST4d0a5A8JeehP4n3x6Jq9xgNzPq84WUy9cvl8Uv52eypKo9bhYEKsgWc8/m83N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269234; c=relaxed/simple;
	bh=qSaTf9Fr1HTYg81JOV4N33GkdogpSxZkoVMlHOO3o4g=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ucaOz0BtJ4iKA1fwt/UGbM3sHEVG/2xq+L6iNHjeY3SSvkCR5j5Dy30ETq9Y2LUnhpEJT6fis9cx3TwLGErrhA8hpx48uQy0EK5ZmjVIeHvpNQkzQNIMsuzL4Me5xrm5FVxxFhwG4kv85dMn8rB1ctkkiHgmtnMbPHmuLZZF2c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=Zeq77+Ui; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="Zeq77+Ui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1748269215; x=1748874015; i=frank-w@public-files.de;
	bh=4f9ppK/Fd1kNyoiyUjqXMTXUiPAGCVkCczNjqtT5OaI=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Zeq77+Ui8Kjqbg/i3xWB5bdnKbVE1cJtiuu5uVpwPF0vZ91/bmbdcYHKJJtRGe4l
	 wAc+GBYVEjEFGrCENKgV0yVCtWCaf8M6t++/JPO962W/150g/gbMMkx07UzMiHiY/
	 Cfr9U2Snk/+JoQOSHUStxNHLmUs54JCcnugZ58QymGgkS36DiITMsz9emlvI6tzCk
	 ILN8WyXR6NPDUkwEVECeUNWBq/qPFvEmqfAVieaPU1GpJFsroEtVO5HVyLAAOjuA8
	 dmfZ8fa5/X7Qr77bl35v25VzmAJN0ceWq4JW5REYY464QDLHpwKvrtaQkvN91HhUo
	 1v6Ig1Maj9Ez03MLnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.70.213]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4axq-1uJ0zB1FSA-008YxW; Mon, 26
 May 2025 16:20:15 +0200
Date: Mon, 26 May 2025 16:20:13 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_arm64=3A_dts=3A_mediatek=3A_mt7986?=
 =?US-ASCII?Q?-bpi-r3=3A_Change_fan_PWM_value_for_mid_speed?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <20250526123123.2515967-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250526123123.2515967-1-mikhail.kshevetskiy@iopsys.eu>
Message-ID: <B06376CB-BE3F-4645-8A4D-A9C67CDCA3EC@public-files.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bxCOo6NnwP4696xdiATBJVUcyR19Efttn+RMrCvL3t5yCIPvHWj
 73AE7T2bI4nXG+51gFZF2YGDQSNvQX/iekaX1HmLMXb06fb9fd1YfOCHCPjPsQCdbl71raj
 BfGhknkUJMIPUHwCS5bJCJZkFzw3j2QGcp9lxdb1xiY6TjPzU+7BBgCRjGxxXSZhtrpTGjH
 lhpp2A3arlGCBDXiNXNzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QJUlpfucOPo=;BMBnJean3iHrUgGqZjLIR5Nn9I9
 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
 g2Mk=

Am 26=2E Mai 2025 14:31:23 MESZ schrieb Mikhail Kshevetskiy <mikhail=2Ekshe=
vetskiy@iopsys=2Eeu>:
>Popular cheap PWM fans for this machine, like the ones coming in
>heatsink+fan combos will not work properly at the currently defined
>medium speed=2E Trying different pwm setting using a command
>
>  echo $value > /sys/devices/platform/pwm-fan/hwmon/hwmon1/pwm1
>
>I found:
>
>  pwm1 value     fan rotation speed   cpu temperature     notes
>  -----------------------------------------------------------------
>    0            maximal              31=2E5 Celsius        too noisy
>   40            optimal              35=2E2 Celsius        no noise hear=
able
>   95            minimal
>   above 95      does not rotate      55=2E5 Celsius
>  -----------------------------------------------------------------
>
>Thus only cpu-active-high and cpu-active-low modes are usable=2E
>I think this is wrong=2E
>
>This patch fixes cpu-active-medium settings for bpi-r3 board=2E
>
>I know, the patch is not ideal as it can break pwm fan for some users=2E
>Likely this is the only official mt7986-bpi-r3 heatsink+fan solution
>available on the market=2E
>
>This patch may not be enough=2E Users may wants to tweak their thermal_zo=
ne0
>trip points, thus tuning fan rotation speed depending on cpu temperature=
=2E
>That can be done on the base of the following example:
>
>  =3D=3D=3D example =3D=3D=3D=3D=3D=3D=3D=3D=3D
>  # cpu temperature below 25 Celsius degrees, no rotation
>  echo 25000 > /sys/class/thermal/thermal_zone0/trip_point_4_temp
>  # cpu temperature in [25=2E=2E32] Celsius degrees, normal rotation spee=
d
>  echo 32000 > /sys/class/thermal/thermal_zone0/trip_point_3_temp
>  # cpu temperature above 50 Celsius degrees, max rotation speed
>  echo 50000 > /sys/class/thermal/thermal_zone0/trip_point_2_temp
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>Signed-off-by: Mikhail Kshevetskiy <mikhail=2Ekshevetskiy@iopsys=2Eeu>
>
>---
>From Frank Wunderlich <frank-w@public-files=2Ede>
>Date: 04=2E03=2E2025
>>
>> sorry for delay
>>
>> i have the fan from sinovoip and that was working for me, but if your f=
an only works with new values, i have no point against this change=2E
>
>Frank, does it means that you are signed off this patch?

Let it count as

Acked-by: Frank Wunderlich <frank-w@public-files=2Ede>

Because i cannot test these values,as i only have 1 pwm fan for r3 in my m=
ain router :p
Maybe R4 fan works too,but not yet tested=2E

Not sure if the complete testcase has to be in the commit description,but =
this is maintainers decision=2E

>Changes from v1 to v2:
> * improve patch description
>
>Changes from v2 to v3:
> * added question to Frank Wunderlich
>---
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=2Edts | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=2Edts b=
/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=2Edts
>index ed79ad1ae871=2E=2Eb0cc0cbdff0f 100644
>--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=2Edts
>+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=2Edts
>@@ -42,7 +42,7 @@ fan: pwm-fan {
> 		compatible =3D "pwm-fan";
> 		#cooling-cells =3D <2>;
> 		/* cooling level (0, 1, 2) - pwm inverted */
>-		cooling-levels =3D <255 96 0>;
>+		cooling-levels =3D <255 40 0>;
> 		pwms =3D <&pwm 0 10000>;
> 		status =3D "okay";
> 	};


regards Frank

Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE2720A5CB;
	Mon,  3 Feb 2025 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607045; cv=none; b=YJqbxcN60oYASRo/fKNW+hGNoraZtDWCx0T8fZ8wItIXq0zaFAXxoilC8aCF+CQtaB2g/CBruTyGvsor3KUhpsIc5fwuK3E8NmUPwb+GOfVFRpm29r/PFGur9qhc1vQfR6XKaArcveN0ot3sJMPTDH+260McJ1bXI/DZvWMOufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607045; c=relaxed/simple;
	bh=T7agafA3ehDJwwcIdTeilSVjCB9/z8KngR8VIMd7BLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tHY/iA/XXJS7jrhNadfhsx+kNQE/YmTXa1W457hQ1gf+o8ZC1T8MUKdrLTWJ6dBaollN1ZiOyVcYbDxm69D9mGHQIB2xt10R+o8BVOeXKBROuEcpMgnXa07nn6SvK3ghZ7+TY5wz6CNO7MxYN2EVHAXB1Kp4QXCRNhdRb1Z+3UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XjWsKOTZ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XjWsKOTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738607018; x=1739211818; i=w_armin@gmx.de;
	bh=KY5Zi9B0yfDIIdsz5RCda26iUB//dpWMUvy4OWh73zc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XjWsKOTZIQEEcs4yPx0JkiMcK77LkVBM2oCC564u6qLkGAuI87xWI7nHoy4NqjNP
	 P3rbOMFLKkRJp3UR/JuU0FkMmS3vhJ8PMXS5xRJZtChu3SIytnIxgLwM1/EV8RgYe
	 NQApYGTSlUPny//0V5w9YaPZ2TBInlyTY/H9ZlXtiHwEis1MRnUPzF1xwNYt92P4M
	 9WrHCK14QVx2ZcRULM23O66DJlfCDnkJCo2T2H2rKzQIQTOUCLzFD4Jb/l9Mh2wm0
	 9xnzQtnMfsuiaI+r9tWm/m017PUBaDMntYdRzCW28mpoo+QNJxTlfrhDZNGvlFPDr
	 WlC1Vm9W2aPhd2CMUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([91.14.238.232]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M1Ycr-1thU4w3RNb-00FpKS; Mon, 03 Feb 2025 19:23:38 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: james@equiv.tech,
	markpearson@lenovo.com,
	jorge.lopez2@hp.com
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/7] platform/x86: wmi: Rework WMI device enabling
Date: Mon,  3 Feb 2025 19:23:15 +0100
Message-Id: <20250203182322.384883-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3M0fg8bnSA1W65bn5VFvkjiILP4zD2QHK532sNRIuwNNqaBM56e
 DJlZTuPMnsE4rHH/JwBXbLItSB4qgVRnxSmBUBOT2rJnU4zVWPa/CxLUEe8N8tThSdFIRAM
 VyYH1xneaGLYSNm4nuik/reNd3t1mvLRTxZ8mDvAhJn08nkpwGEXn8cg4ohLV/8OZtsxYDv
 S5bDjV/QMdefQEFz/ocRQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mZ1tUUMeuRA=;pTLAtsxCDZALBVWMnnnWAsoVk1q
 U9TAAU8ZUaRCb8HJpBNOQp2NEvf26rCgqDtNNjHXsIBbOQxoLVmRyT++L/FWdDX6or+f+nQgP
 iwGKDxekOjwFVywu9XNe6iBPmPXHit7B6CRoBrpuFSHfnMc/lUY6Y/4Pyl1nkLB3yvJ54oNck
 Rv6p6Dhy2O7X+lz5t2IGLhbsxkAkITd1ylLpmkun6JsVGMS8jFTaoyviRO/TAPQKK28N/P0Y9
 T72eiGn4ozMdnKbFWaGwoTC8kD3gE4x6kvTXf0gFd6gIVxrOr7gh7bOfKWTGH/kfiW0Y0R5Jm
 M+xuP4w0pcgzBX6pfn9/8kLR6bPQr79Epdr4uU9TrcGi5KzxyUb95LGbZm1YN3cg9MJSCSBts
 bl8E1E87wyah6w3TIotzCmG8vz9CHglSE5q7LcuslZavcKozTaMDbJO2S44Y5r2duSmb1FcF9
 V0B2dZsoh8Nlz5qvqLN6DWZeYdVoviZg4c5k2xWtDwgc4OzB5WXVZMjACEvCjA6dCC4a+SAB7
 5EUQqyCAXzfRtVd6THJEE5hDS9RTf3BYEA8SjRpqi3SYV17/S+I/nBH0rpa2qsAgY0bZArgox
 eaX7/T/BZc7JvaavtTVJsotrk9/5xbGxgiU4wOKxrbKDNTFo7QIRFW8iI05UIcQjC0kasHBTp
 oqlcvh/NW6ccSOBXiG89b9d13kPiqLsxCMhBjCpUSZhuCLas4GZxjmDJYS46l38D0tH3qnF8q
 FHUOUBakl6mRG9qbs9vJx0eop1D4+BdNMQHUVeOL/+xWwNW/twfdeVCcDmGlcitHpDMqCfNSh
 TxuJgJYmqe9Tf9nkYExunzUbOwzxYGLeApH4qTIxQRz3xo+Dmy6PsCrH6jRHQrcqMkrmvf6a/
 hMgSPhYYRoTOyNLWFczqtnVaIAea45x37jMFtV8AmHYQFZn8IPWQf8oPlx3mRSbVolX05PiHG
 ElzFApdExzJ3JvjGb8j7PcTvv6z0y9Vl7Cl066z4YdJ/SkbOpQt6XZ31Lageh/wJhm5/LGrvP
 Aer3IeHr/K6SOys3Onkem4PQqSR7reASOsuzCt1R4E5W9X/D198VDLi5iB9fPFuZRWh0KBFrN
 KNz8mwXTuBTVX+X+BEVGoUsZwk39B8vRECrAZAUGm5hdiP0xEIfn5Z1X7PFZ3SWLhKSalkF6X
 mtqZRAM9LEXA78BL448FMwzAP/S9Cab93juQu4oewX1fs0yxUOvE6XH8o2ii5fBCmizBDdTEk
 yjqD8cAUmF59UwI92wOvMHAD3Nlo/URoT3yNxW40/UY6kJxcImFJYuSnoVIFv0EfCW2sFZKmR
 pp+4dLrgP57QqFS2Nz+iG8X74WF+hT0UBoWWQG/PfbWRSA=

This patch series reworks how WMI devices are enabled and disabled
to improve the compatibility with various firmware implementations.

The first three patches make sure that no WMI driver using the WMI bus
infrastructure is using the deprecated GUID-based API to access the
underlying WMI device.

The fourth patch is a unrelated cleanup patch.

The last three patches finally rework the WMI device enabling inside
the WMI core and update the documentation.

The WMI core patches have been tested on a Dell Inspiron 3505, but
the remaining patches are compile-tested only.

Armin Wolf (7):
  hwmon: (hp-wmi-sensors) Use the WMI bus API when accessing sensors
  platform/x86: think-lmi: Use ACPI object when extracting strings
  platform/x86: think-lmi: Use WMI bus API when accessing BIOS settings
  platform/x86: hp-bioscfg: Use wmi_instance_count()
  platform/x86: wmi: Rework WCxx/WExx ACPI method handling
  platform/x86: wmi: Call WCxx methods when setting data blocks
  platform/x86: wmi: Update documentation regarding the GUID-based API

 Documentation/wmi/acpi-interface.rst          |   3 +
 .../wmi/driver-development-guide.rst          |   4 +
 drivers/hwmon/hp-wmi-sensors.c                |   4 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |  13 +-
 drivers/platform/x86/think-lmi.c              |  51 ++++----
 drivers/platform/x86/think-lmi.h              |   2 +
 drivers/platform/x86/wmi.c                    | 114 +++++++++---------
 7 files changed, 96 insertions(+), 95 deletions(-)

=2D-
2.39.5


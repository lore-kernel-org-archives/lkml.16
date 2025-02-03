Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B888820E038;
	Mon,  3 Feb 2025 18:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607071; cv=none; b=GyAYXBRn2PGkHY/gU+2M5rPqtwvAaIOejedGcKV4zN5Wm4zmJ6zHNPbEU+HErsiu/h/oEhpdZjCwixUN5gdd/8izhp4sPLDUln1J2bUYYG73y41LeOC75vCjgXuRlO5WKFrpbCoSeNZSUnyEHNbcHzt8mgXMyMmL1yDTeNksEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607071; c=relaxed/simple;
	bh=ID+lTHjLVqPJ/7xdhI9bJLFn9teO4+JhdZK9zVjbwuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g+IpM6UDBaxELt6dSREMQqVWzBr6uxL5mAV23c5lD6pKlC7Z0a9aCeKfOhaG61zNBFMdIDpdKN6RAuFL6Cj3kjPlHL6SbMIyck+7ykmfFCAb03FGI3z9XfC725W49Dui4focqCcunj6Zkq7oCOufHcU3R2KvsBVqaLI4v99Dwhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aWhPhmlR; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aWhPhmlR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738607039; x=1739211839; i=w_armin@gmx.de;
	bh=RuoP/0xYYt9z3bJOrdWbm40zFLkGkpfWsyjNl2p49Lk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aWhPhmlRArsn+pDgJ2w/O1mTO55kfaAAZn58tcZ+hb2T/3SNnY7FghUnQx4ZaDHI
	 6aQ2VvbDUNusgIJorWP9rBDNlIvzLjvBjG8tL5/+NLu+j2MromQvTN4p+zx684FjM
	 0B/iK7Usdp6gX4v4pYatzKA7aXInMEpKiZaIbI9jV8OBrD16sqalIxqID2XESWPaG
	 Gc5/XCsQpZgqRri7wix1JPchGYmsm2q+mT+HAnGZXoM8Z4DMOiUvWjJM/993J55V6
	 qgK5b5jpYxbkqEkE1//ZUNvhSL0JkLp3bcCcgnYa3/Fr4InePKvr0ofCeih/J1IBg
	 Uz6qFEXEUE+dqQ9bqA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([91.14.238.232]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N4zAy-1tFxlr1lkC-0106gf; Mon, 03 Feb 2025 19:23:59 +0100
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
Subject: [PATCH 7/7] platform/x86: wmi: Update documentation regarding the GUID-based API
Date: Mon,  3 Feb 2025 19:23:22 +0100
Message-Id: <20250203182322.384883-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203182322.384883-1-W_Armin@gmx.de>
References: <20250203182322.384883-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6wNh6ZLBhn/RTk1uI75rS1eo+d5PKvpI3IUTypVYdaxgUADGLyB
 agytg809oy6KvZRjQsDGpuJIZGos0r92nQZiAeCHicdZvD45ZewgETSrltkawq/BR/DG+kX
 pk7uINd1aSzUocKO13d3sH+DEW55aonnzupH/qTr2lsT02YPDiQZmuDVHJhzyA4Ay4URbvo
 7XFix0eHzgYs+YE8+IE2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9wiWRpfj7xw=;LWzqhLjD36c8j2gTfbmciDyXoWM
 OIZz1QSBdDMriNr/kZMaAdiE0rIIC3xw/qwJDo6Ejm/LKvJLiVV3yNqx7Or2LKHswMBubkLA/
 3jS8uC1sLk2Ca9lAhAy0gY52OFMoeCUYA4jodICWzNJHv08vI0rMyEPIN6sruLwcvQpwqkLzV
 djJ1mqnwRDV6W1QKA581rAkLuNPQu02RRtHArPnKJPDEqayk41dR2+vbEPit5CSxnaTITOxny
 tiJugjKXIQzi2/A7gcxvbt/UXXK9teD9kOGHYp5JZ+TzGAmWyTT2OnFPOhehKWdxiSFdgm/zt
 7zMJt3RlbJnBNpwwBXviprf7E1q1Rsh3oq6gh3iRGOgnBr8qasPwL5Z5cj2DtyhnUmpq+u/dQ
 BwqZukMRki+A3NuenpSlGMNP/lFR9XAzzwYCOFDwTuzOm8sOBIlZfHKqleSyMVQaP9ihxVaxl
 9VbZw+d/Uo68vBMUjXzNr7tXdf4K9bipBQ0vypWTu+Kv+2p/Pq0/9UlpDyodiHpMdhixm2iJe
 I+fnzs1nbQHFeKRInHI7jldHZvxTmsXromwTf56gqajE7w5rh0SvIH1Vv+YU/A6abO6m18thb
 reFWPsdeXsDP+Dj6B9wcWVpXBVDhiQ6lD6LhYJCmu7oW9sFz4xFKaPxGqnwg+mDqAA6i8kNBx
 LWu6oG3LvtH2cJr3xMEyJ041nDzzefswavSQzXPmobPxsMn5hs7v3cGAFcU4Y8kS2Z4B5fEm1
 MDbwekjN5PsFMEkEq2F6M3n3/B5JIgbi8MrxvsrCJauO2HelHITumQZpakqBhkivWP8T0H6na
 7CWFF+4r76b1HndoSz/EN3Z53uZ66hFFHX+WldBkcNFL3GQoScDYXG5aCJ8lAYxv5eVbJZ8y/
 EFYSPVdYStBV5+VaN9Av6EIOPGDjQnMtNGku0aDn0qRjRzuQdP23vd6K8sKxec5woSwiwF7n8
 XBPgKVrWiemorU29olBzIQlOKRoWNPDiEcmoRiBp8lp2rG8ECYtAwdpmLYmw0SFkQCoMAvODh
 CGm6N26miQ2PBKoJT+EhiMmUefpvDKNlRWtD4tJublZTiS7ydszhzCi3UgpeAt3C7yRqY+csP
 tj5Yh7lo8X8OLDF+pwehWPJqWawztz4ncPFdLSp38t+7MY254rqXQlcWptx5/v+S7gPhVRcxN
 bYe9XTlN4q04YTy8ignR7uxZHC9mpi1JCMFtK7dx0g4Alkb4+CNf5MIF0jIR6MnYxMciHtRHt
 btvNxJPRcGYCyoTB6ucii4zoAHtkxcHU/Qnvqm1SUw3xdt5+3BUpzoVSLZbw4/twdBV+A4kYn
 V6SdPj/krlLVoKdPsoGOCDxkte0OHWwhveg0AGTXiXmyzE=

Warn WMI driver developers to not use GUID-based and non-GUID-based
functions for querying WMI data blocks and handling WMI events
simultaneously on the same device, as this will corrupt the WMI device
state and might thus lead to erratic behaviour.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/wmi/driver-development-guide.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentatio=
n/wmi/driver-development-guide.rst
index f7e1089a0559..99ef21fc1c1e 100644
=2D-- a/Documentation/wmi/driver-development-guide.rst
+++ b/Documentation/wmi/driver-development-guide.rst
@@ -96,6 +96,10 @@ on a given machine.
 Because of this, WMI drivers should use the state container design patter=
n as described in
 Documentation/driver-api/driver-model/design-patterns.rst.

+.. warning:: Using both GUID-based and non-GUID-based functions for query=
ing WMI data blocks and
+             handling WMI events simultaneously on the same device is gua=
ranteed to corrupt the
+             WMI device state and might lead to erratic behaviour.
+
 WMI method drivers
 ------------------

=2D-
2.39.5


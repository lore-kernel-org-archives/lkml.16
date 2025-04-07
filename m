Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A12C1B040D;
	Mon,  7 Apr 2025 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036005; cv=none; b=QfMVaXf5y23fRvM2VPK0nLI8zn4HiC9XDlIpVt3/8pRg4isyMI40eP232OBOoojBf53wKjoNXVNKxoDhRBUIsjsyNPYr9HVmPIvcnmxZ2m9Nx8qNF4YCzZHvDpBHO54MxMTe1P0U/MxlG9s2OKCEBuBGBTQADOfvGKpWoAa33OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036005; c=relaxed/simple;
	bh=i5QeRTJ4wZvcsOVrDCD4cxOIezlH5OfoOAm/7+gDxZU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EPaicFGoo7/NMWzQw+wF17QJ+D9vnpGlg5SBLLz7cUP5JMn0FcibxWsZFqvBfitPNpYHQznHhC6PerPgT0u/OdxiImCCHjKeQzgAvKkmkBYWqAzZ2TuibzC4hQWbrBMKkRlcIqWjRrIIB2bMbbuiPfLrgCkX8zFBhrzzdbQHfFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com; spf=pass smtp.mailfrom=dh-electronics.com; dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b=QzZ0HwG0; arc=none smtp.client-ip=116.203.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b="QzZ0HwG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1744035433;
	bh=Tw+jh4xG+pO+8sA5mfFF2qIiv6zO55JdMVdaA4kMzwY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QzZ0HwG0iOvqjM+JZS7JJtNsFvHpsFyoKr00R+5kU3/W5n/5DpEITnRnrhdCOczJn
	 n0oKJOQ+TWjnEKjw7nIP2CKUf94apFGKMT90p1QrZ+RwxaCG0uo7yJk+d6OGCHs4L3
	 VGaYrYw1RciiKbE8ZkXmeIwbu2xWHRRizMcjtEK217FkkmJbXcfT/BFKl0jP5yBob7
	 kRiu+2bTob2atF9GhXPU8ixpofS4WwejMgQ+qaDoxhVM065L0uJV5BGpK7Ku6t+MPZ
	 TIOYAUWa/bn1UJxys2ngVmzWcrPIoOXeHOujawt2I2P/IrnLYWpDeKSFucqhYFrWQD
	 5OuiX9gFGiDbg==
X-secureTransport-forwarded: yes
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Mark Brown <broonie@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>
Subject: RE: [PATCH 0/3] regulator: userspace-consumer: Add regulator event
 uevents
Thread-Topic: [PATCH 0/3] regulator: userspace-consumer: Add regulator event
 uevents
Thread-Index: AQHbpWdCFTa8WJXI70ea5+K9p5nNDrOTmnmAgARlZbA=
Date: Mon, 7 Apr 2025 14:17:10 +0000
Message-ID: <a18c4ad3b9f647c08d71b4550b5f1cf9@dh-electronics.com>
References: <20250404134009.2610460-1-jneuhauser@dh-electronics.com>
 <b5fa7d1a-16bf-4031-8990-f559cf589b67@sirena.org.uk>
In-Reply-To: <b5fa7d1a-16bf-4031-8990-f559cf589b67@sirena.org.uk>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From: Mark Brown <broonie@kernel.org>
Sent: Friday, April 4, 2025 7:03 PM
>
>On Fri, Apr 04, 2025 at 03:40:06PM +0200, Johann Neuhauser wrote:
>> This series adds support for regulator event reporting via uevents to th=
e
>> userspace-consumer regulator driver. The goal is to provide userspace wi=
th
>> a straightforward mechanism to monitor and respond to important regulato=
r
>> events such as overcurrent conditions, voltage changes, and enable/disab=
le
>> transitions.
>
>This sounds like you're trying to use userspace-consumer in production
>rather than as a test bodge...   what's the actual use case here?

Hi Mark,

Thank you for your feedback and question.

We have a hardware setup where the USB-A port is directly connected (D+/D-
lines) to the SoC, while its VBUS line is driven by an external I=B2C-based=
 PMIC.
If a connected USB device attempts to draw more than approximately 800mA,
the PMIC detects an overcurrent condition, automatically disables the outpu=
t,
and communicates an overcurrent event via the regulator framework.

Currently, the generic USB HCD drivers lack a built-in mechanism for handli=
ng
or recovering from such regulator-related events, particularly for reportin=
g or
re-enabling regulator outputs after an OC condition occurs. The DA8xx OHCI
driver is one exception, as it indeed provides such functionality, but
integrating similar support into the generic USB HCD drivers seemed unlikel=
y to
be accepted upstream.

I came across the userspace-consumer driver and believed it could help mana=
ge
this specific scenario. With this driver, I was able to manually toggle the
regulator off and back on, successfully clearing the error state. However, =
the
driver lacked proper event reporting, making it difficult to identify when =
the
regulator had entered an error state. Therefore, I proposed adding regulato=
r
event reporting to enable userspace to detect these regulator events via ud=
ev
rules and subsequently restore regular USB power operation.

While I was aware that using the userspace-consumer driver might be seen as
somewhat of a workaround for special cases, I did not fully consider that i=
t
was intended primarily as a temporary testing solution and perhaps not suit=
able
for this kind of production usage. I'd be grateful for any suggestions or a=
dvice you
might have on the appropriate approach or alternative solutions you could
recommend for upstream integration.

Thanks for again your input and guidance!

Best regards,
Johann


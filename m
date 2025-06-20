Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D32E5BAF0;
	Fri, 20 Jun 2025 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430801; cv=none; b=H6PEoMtdKsSckjetJkatzH9LtljWHy7hzQ+GQnlR3h9cXu/ynWSx8Aaox4MeP/zIUFoIo7fecKEHlJI1ye1UrwDuj3ISufRqgi+Jz1IJrHW1aVkTpWPXWNJ/5rWdtgRSgG7sJv12yZ6woBJW0CZVly+yLMQL9wHmwOsCpYR+hU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430801; c=relaxed/simple;
	bh=ABf6EwWTGkcZcPTeOeyFfUPP2cHPPDEntIOdF3urxX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UVX7qhCsqRh1X8jnVugnybgK3Oezzndhs46tWhBsD9tvjfw03Wbm1AFnU+xJdJfROFmZT5xWh5iUrvh8/MIYxzPGHt/6ihX4oOwTNnSLgS9M9rQcFja5cM0z6krNMO0e2REaEhHmccDAkAUFZ2ySJYyA1ZR4i/cgtyOuknNmWYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=R2JA26jZ; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="R2JA26jZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Orp3DJwdoLCPJivzW1fDqgU7aiPGhytEa2iFmC1YDdM=; b=R2JA26jZ0BrujI9rFnb9eL99L2
	PFXTbh86tFuEbsw28Cdki8KTSRniTlCNDe+0+lwJ9vxKZNxhLUN6A9Q7znNIpDSY5Y3t4ijZLf7Vo
	RYJPXBosaR1GxykTh8WxbvO/6jGN+E9hr6aOiv4pScI+kV0H6Qth9CQ6ZqVoGElCQLL/wK61LjruT
	5uYKy8WIBRyiAaGhvcKkkZtoTL+CL58lXkEWhCMnwCDDOhUcXv2a00zipHEVC7Bib6HME4y8FF17v
	zPBgAXBBC1OM3Qiu5YCNT1Ll5JpHpaJIVVm8ZVce11tzQbNfmRSCmq9rnMCUWIAIK/STJstaPtVoa
	pvuW75rA==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:43571 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uSciZ-00000007rNQ-0bb5;
	Fri, 20 Jun 2025 16:27:44 +0200
From: nicolas.bouchinet@oss.cyber.gouv.fr
Subject: [RFC PATCH 0/4] Support for usb authentication
Date: Fri, 20 Jun 2025 16:27:15 +0200
Message-Id: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMNvVWgC/x2MSQqAMBDAviJztlA76MGviEiXqc6lShcRpH+3e
 AwkeSFRZEowdy9EujnxGRoMfQf20GEnwa4xKKlGOSkpSjKbLvmgkNnq3HSBiMbpySN6ghZekTw
 //3RZa/0AN0n0YWQAAAA=
X-Change-ID: 20250620-usb_authentication-333bda6f33fe
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
 Kannappan R <r.kannappan@intel.com>, 
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>, 
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>, 
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>, 
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

We have been working on the implementation of the USB authentication
protocol in the kernel.

You can find our work here https://github.com/ANSSI-FR/usb_authentication.

It is still work in progress but we would like to start discussions
about the implementation design and its possible integration to the
Linux kernel.

Best regards,

Nicolas and Luc

USB peripherals are an important attack vector in personal computers and
pose a risk to the cyber security of companies and organizations.

The USB foundation has published a standard to allow the authentication
of USB peripherals ([1] and [2]). It defines a mechanism for the host to
request credentials and issue an authentication challenge to USB-2 or
USB-3 peripherals, either upon connection or later during the use of the
peripheral.

We currently envision the following use cases for USB authentication:

- company networks where computers and peripherals can be privately
  controlled and administered;
- USB cleaning or decontamination stations;
- individuals who want to prevent unauthorized device plug-in into their
  machine.

The implementation of this feature will obviously necessitate efforts
from both the kernel community and peripherals vendors. We believe that
providing an implementation of the host side of the protocol in the
Linux kernel will encourage constructors to include this feature in
their devices. On the other hand, we are working on implementing
reference code for embedded devices, notably for Zephyr OS.

The USB authentication protocol is based on a simple signature
challenge. Devices hold between 1 and 8 pairs of private signing key and
x509 certificate. Hosts must possess a store of root Certificate
Authority certificates provided by device vendors.

The protocol exchange is driven by the host and can be decomposed into
three, mostly independent, phases:

- The Host can request a digest of each certificate owned by the
  peripheral.
- If the Host does not recognize the peripheral from one of its digests,
  it can read one or more certificates from the device until a valid one
  is found.
- The Host can issue an authentication challenge to the peripheral.

On the host side, this requires the following functions:

- handling the protocol exchange with the peripheral;
- X509 certificates validation and administration (root CA loading,
  certificate revocation…);
- cryptographic functions for the challenge (random number generation
  and ECDSA with the NIST P256 -secp256r1- curve);
- security policy management;
- authorization decision enforcement.

We chose to implement the authentication protocol exchange directly in
the kernel USB stack during the device enumeration. This is done by
first requesting the device BOS to detect its capacity at handling
authentication, then if supported starting the authentication sequence
with a digest request.

The implementation of the other functions is open to several design
alternatives, mainly based on their distribution between kernel and user
space. In this first implementation, we chose to implement most (all) of
the cryptographic functions, certificate management and security policy
management in user space in order to limit impact on the kernel side.
This allows for more personalization later on. The communication between
the kernel USB stack authentication function and user space is done via
a generic netlink socket.

The authorization decision enforcement can be done via the authorized
field of the usb_device and the associated authorization and
deauthorization functions. The usb_device also contains an authenticated
field that could be used to track the result of the authentication
process and allow for more complex security policy: the user could
manually authorize a device that failed the authentication, or manually
deauthorize a device that was previously authenticated.

The USB authentication protocol come with some inherent limitations, [3]
does a good job at describing most of them. During the implementation,
we also found that the value encoding of the Validity field in the x509
certificate differs from the RFC5280 [4]. This has prevented us from
using the x509 parser included in the Linux kernel or OpenSSL, we chose
to use the mbedtls library instead [5]. This obviously does not prevent
others to replace it with their preferred implementation. It will also
open discussions on the protocol enhancement.

The architectural choice to place most of the cryptographic and security
management functions in user space comes with its own limitations.

First it introduces a dependency on the user space program availability.
It will probably be necessary to introduce a fail-safe mechanism if the
authentication can not be completed. Also, during early boot stages the
user space service will be needed in one form or another in the
initramfs.

The second limitation is that the device initialization process is
paused multiple times. Each time, the hub lock is released in order not
to block the rest of the stack; and then reacquired when a response has
been received from user space. The resuming of the operation on the
device must be done with great care.

Last, we do not yet interface properly with the rest of the usb stack
and thus do not enforce a strict control of the two authenticated and
authorized fields. Other sections of the kernel or userspace are able to
overwrite those fields using the sysfs exposed files for example.

The current kernel implementation of the USB authentication protocol is
experimental and has the following limitations:

- It does not yet handle all possible protocol errors.
- It has been tested with a QEMU mock device, but tests with real
  hardware are still in progress. As such, the over-the-wire protocol
  has not yet been fully validated.
- The kernel/user space communication has not yet been completely
  validated, including the interruption of the worker thread and its
  resuming.
- Device authorization and deauthorization has not been completely
  implemented.
- It lacks an overall documentation and test suite.

Our current kernel patch is obviously a work-in-progress and not yet
ready for merging. We feel it is best to start a discussion on the
architectural choices and gather early comments that could be used to
improve the design.

Concerning the user space functions, they are currently implemented in a
small independent executable as a proof-of-concept. In the future,
integrating it in existing larger projects, like USBGuard [6], would
allow presenting a homogeneous USB administration interface to the user.

We would like to get comments on the proposed architectural choices
regarding the repartition of functions between kernel and user space and
on the implementation in the USB stack, mostly concerning the releasing
and reacquiring the hub lock multiple times during the authentication
process.

You can find in the following repository [7] the necessary code for
creating a test environment:

- the Linux kernel patches;
- a python utility to generate a small PKI for device enrollment;
- a C minimalist service to implement the USB policy engine;
- patches for QEMU to implement a mock USB device with the
  authentication capability;
- a testbed to compile and test the project.

- [1] “Universal Serial Bus Security Foundation Specification”, Revision
  1.0 with ECN and Errata through January 7, 2019
- [2] “Universal Serial Bus Type-C Authentication Specification”,
  Revision 1.0 with ECN and Errata through January 7, 2019
- [3] J. Tian, N. Scaife, D. Kumar, M. Bailey, A. Bates and K. Butler,
  "SoK: "Plug & Pray" Today – Understanding USB Insecurity in Versions 1
  Through C," 2018 IEEE Symposium on Security and Privacy (SP), San
  Francisco, CA, USA, 2018, pp. 1032-1047, doi: 10.1109/SP.2018.00037
- [4] RFC 5280, Internet X.509 Public Key Infrastructure Certificate and
  Certificate Revocation List (CRL) Profile, May 2008
- [5] https://www.trustedfirmware.org/projects/mbed-tls/
- [6] https://usbguard.github.io/
- [7] https://github.com/ANSSI-FR/usb_authentication

Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
---
Nicolas Bouchinet (4):
      usb: core: Introduce netlink usb authentication policy engine
      usb: core: Introduce usb authentication feature
      usb: core: Plug the usb authentication capability
      usb: core: Add Kconfig option to compile usb authorization

 drivers/usb/core/Kconfig                  |    8 +
 drivers/usb/core/Makefile                 |    4 +
 drivers/usb/core/authent.c                |  631 +++++++++++++++++
 drivers/usb/core/authent.h                |  166 +++++
 drivers/usb/core/authent_netlink.c        | 1080 +++++++++++++++++++++++++++++
 drivers/usb/core/authent_netlink.h        |  157 +++++
 drivers/usb/core/config.c                 |   51 +-
 drivers/usb/core/hub.c                    |    6 +
 drivers/usb/core/usb.c                    |    5 +
 include/linux/usb.h                       |    2 +
 include/uapi/linux/usb/usb_auth_netlink.h |   67 ++
 11 files changed, 2176 insertions(+), 1 deletion(-)
---
base-commit: fc85704c3dae5ac1cb3c94045727241cd72871ff
change-id: 20250620-usb_authentication-333bda6f33fe

Best regards,
-- 
Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C4225FA07;
	Wed, 25 Jun 2025 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860002; cv=none; b=t5jSmQCGr9hk7Wma5wdNiteuUes7ccv29gAdeSuAl3tuRDXavKsIn92mMEUWji9kezVfkFib0OTf9654QN2L0kkQOnve+94qt4g3d/J65UH1NL/Re3HMSwV75ppQ80PT3+IrMBfkXW2YYEDkkL8EBQZJQYVOor98KaD4fq4lBRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860002; c=relaxed/simple;
	bh=z9Mh5NxDhxrXtxph/P2pAXti2Wjh3Kg66nbWIs2/0J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nC4F0n67FtIBWfQaVsJGsChjN4KzZg8TLcvuPHjKwSF6ytOaxHegocU5psba60tepjHS4kQbk4kR6pZSF2Lm4srczzowUZgZ+ZgEBI9Rtz8Yakv0BYaIAx0eYE5STqLcSoLBk2TPkc+/9lNju7dkkSDu/kvreYaX5udGkjKCujU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3238D106F;
	Wed, 25 Jun 2025 06:59:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A59E3F66E;
	Wed, 25 Jun 2025 06:59:56 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:59:46 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 1/7] firmware: arm_scmi: Define a common
 SCMI_MAX_PROTOCOLS value
Message-ID: <aFwA0n2krgW0_cNr@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-2-cristian.marussi@arm.com>
 <20250624031351.GC10415@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624031351.GC10415@nxa18884-linux>

On Tue, Jun 24, 2025 at 11:13:51AM +0800, Peng Fan wrote:
> On Fri, Jun 20, 2025 at 08:28:07PM +0100, Cristian Marussi wrote:
> >Add a common definition of SCMI_MAX_PROTOCOLS and use it all over the
> >SCMI stack.
> >

Hi Peng,

thanks for having a look.

> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/notify.c | 4 +---
> > include/linux/scmi_protocol.h      | 3 +++
> > 2 files changed, 4 insertions(+), 3 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> >index e160ecb22948..27a53a6729dd 100644
> >--- a/drivers/firmware/arm_scmi/notify.c
> >+++ b/drivers/firmware/arm_scmi/notify.c
> >@@ -94,8 +94,6 @@
> > #include "common.h"
> > #include "notify.h"
> > 
> >-#define SCMI_MAX_PROTO		256
> >-
> > #define PROTO_ID_MASK		GENMASK(31, 24)
> > #define EVT_ID_MASK		GENMASK(23, 16)
> > #define SRC_ID_MASK		GENMASK(15, 0)
> >@@ -1652,7 +1650,7 @@ int scmi_notification_init(struct scmi_handle *handle)
> > 	ni->gid = gid;
> > 	ni->handle = handle;
> > 
> >-	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTO,
> >+	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTOCOLS,
> > 						sizeof(char *), GFP_KERNEL);
> > 	if (!ni->registered_protocols)
> > 		goto err;
> >diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> >index 688466a0e816..6f8d36e1f8fc 100644
> >--- a/include/linux/scmi_protocol.h
> >+++ b/include/linux/scmi_protocol.h
> >@@ -926,8 +926,11 @@ enum scmi_std_protocol {
> > 	SCMI_PROTOCOL_VOLTAGE = 0x17,
> > 	SCMI_PROTOCOL_POWERCAP = 0x18,
> > 	SCMI_PROTOCOL_PINCTRL = 0x19,
> >+	SCMI_PROTOCOL_LAST = 0xff,
> 
> The enum says this is std protocol, but 0x80~0xff is for vendor extension.
> It might confuse others to keep "SCMI_PROTOCOL_LAST" here.
> 

Yes indeed. This patch was lingering around since ages in my trees and
it is probably to review in itself.

> > };
> > 
> >+#define SCMI_MAX_PROTOCOLS	(SCMI_PROTOCOL_LAST + 1)
> 
> How about "#define SCMI_MAX_PROTOCOLS 256" as the line you removed in notify.c.
> 

Yes, probably the easiest thing to do.

Thanks,
Cristian

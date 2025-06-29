Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF16623B63C
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751224352; cv=none; b=sW7LLQUupi7TsENPLzE2r/8gWWmg9fI2BfV3XnW4A0SWXyyEQb7fU9dm1OLZTYoWIIwECecdDWO4Z+J2QOk6FMWvioxtFa7Uu9gOEeZ0q3nPBprdzE7ItM+UGIpBEwfJTvYK9iuN05PObWBGX+ohuJjXxy5/9hQWSHoPdJfoFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751224352; c=relaxed/simple;
	bh=DmT4Bise/vCChRzplVSqDd2BI/p2bI1iSO9roexnDw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMDMMabfT+wPWMCPVrMXOU4o3ZsPGU9Y0kujAvDR/+1kf0oJ6hxDNGVEZ98xDvTlbeKs1CO2bLF1kYSdCA70LXMin/KRGyliqMIAgxCP7Zgkx+F4C9fjd53jhZBuL8iDCD9CpepiCK/0tbzs50gt66TFlZlFWbIaLmTLmPKKh8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZgoXPVA0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZgoXPVA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751224350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4XK1DvpuFfEECjOWlQarzmEVhfydKQ9Mv1sIMUipbGI=;
	b=ZgoXPVA0T7L9Trz6zawGZKTv5kgaEpZPlWQf8vXwdE4mDL67mfVlGr1Si/BblGqu0HPVL7
	e7OWr/Jn5xTjykczch/EYYL1pI7yfppgydiUPxW45r7U00YbiuzSvMHM3bu1A2vOf+Jl5s
	jtA75DJxoHmSuH0abBYTVKIQs4qrVlc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-q2Xtx-tPOZuVAqnRsgfBzw-1; Sun,
 29 Jun 2025 15:12:26 -0400
X-MC-Unique: q2Xtx-tPOZuVAqnRsgfBzw-1
X-Mimecast-MFC-AGG-ID: q2Xtx-tPOZuVAqnRsgfBzw_1751224344
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A10919560AE;
	Sun, 29 Jun 2025 19:12:24 +0000 (UTC)
Received: from p16v.luc.cera.cz (unknown [10.45.224.33])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF7E0180035C;
	Sun, 29 Jun 2025 19:12:17 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michal Schmidt <mschmidt@redhat.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH net-next v12 12/14] dpll: zl3073x: Implement input pin state setting in automatic mode
Date: Sun, 29 Jun 2025 21:10:47 +0200
Message-ID: <20250629191049.64398-13-ivecera@redhat.com>
In-Reply-To: <20250629191049.64398-1-ivecera@redhat.com>
References: <20250629191049.64398-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Implement input pin state setting when the DPLL is running in automatic
mode. Unlike manual mode, the DPLL mode switching is not used here and
the implementation uses special priority value (15) to make the given
pin non-selectable.

When the user sets state of the pin as disconnected the driver
internally sets its priority in HW to 15 that prevents the DPLL to
choose this input pin. Conversely, if the pin status is set to
selectable, the driver sets the pin priority in HW to the original saved
value.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/zl3073x/dpll.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
index e67ef37479910..f78a5b209fce7 100644
--- a/drivers/dpll/zl3073x/dpll.c
+++ b/drivers/dpll/zl3073x/dpll.c
@@ -439,6 +439,38 @@ zl3073x_dpll_input_pin_state_on_dpll_set(const struct dpll_pin *dpll_pin,
 
 		rc = zl3073x_dpll_selected_ref_set(zldpll, new_ref);
 		break;
+
+	case ZL_DPLL_MODE_REFSEL_MODE_AUTO:
+		if (state == DPLL_PIN_STATE_SELECTABLE) {
+			if (pin->selectable)
+				return 0; /* Pin is already selectable */
+
+			/* Restore pin priority in HW */
+			rc = zl3073x_dpll_ref_prio_set(pin, pin->prio);
+			if (rc)
+				return rc;
+
+			/* Mark pin as selectable */
+			pin->selectable = true;
+		} else if (state == DPLL_PIN_STATE_DISCONNECTED) {
+			if (!pin->selectable)
+				return 0; /* Pin is already disconnected */
+
+			/* Set pin priority to none in HW */
+			rc = zl3073x_dpll_ref_prio_set(pin,
+						       ZL_DPLL_REF_PRIO_NONE);
+			if (rc)
+				return rc;
+
+			/* Mark pin as non-selectable */
+			pin->selectable = false;
+		} else {
+			NL_SET_ERR_MSG(extack,
+				       "Invalid pin state for automatic mode");
+			return -EINVAL;
+		}
+		break;
+
 	default:
 		/* In other modes we cannot change input reference */
 		NL_SET_ERR_MSG(extack,
-- 
2.49.0


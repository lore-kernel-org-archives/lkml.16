Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3B1253B43
	for <linux-kernel@vger.kernel.org>; Wed, 19 Mar 2025 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376652; cv=none; b=OabmqFGtcYAg4v/XAXWvNLlLJkDD48jWaALN4uQHYqnZCyYfYW/P/XLqdsendJidLEyjVkQDL2KlbsAXjynlucMeoB7j7Ro0vn8G9EPTe2O0sjQH6416z4HY3Ep5HJoOEehFDE5wnKqw8lb0ixfyI5HUUI1aycXQWANB8Erq51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376652; c=relaxed/simple;
	bh=OkcOnPgwzPVAnLmEz2RKWbbG92ntdJe59vSCBAlm+QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r81hstNu2cqjyrdoyVQx95ytlnvgPfpD42cflxEBH48KB4I/yODf1wfPndxBt/XBA7KR8E9QVCVAAUKpqlOzKkHZ5iDl+fx5QgMtJn3rTo0Sd6FU0wjVcNW5syZm4w4AH8YlAAdTXTQToWtMpaHEpbI1LvYKiNS7ii2Vyi6m12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ao9dMtML; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ao9dMtML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A583C4CEEA;
	Wed, 19 Mar 2025 09:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376651;
	bh=OkcOnPgwzPVAnLmEz2RKWbbG92ntdJe59vSCBAlm+QQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ao9dMtMLQEUVu+fjWsBoLEqqh0R+BhKkWJpizhHO36TaM6xnso/mU/mpIJ2LwEzG6
	 w3qBHEHoLZjoB/UDlEpK5DuDRj10RZg/HCkbLCytm8gufochwYvQZlmyjxwMpo2nY5
	 pE9TarQ4MKyl9c1jlBi8CtkYT0LdO2umrsieILKUnjOtAlru8pwlOrNOS+zbyMH9OY
	 Oe/1psdD8KujbLy2TDTLaCyhXoRNuGpPLiBQnuvUkw3mFaqEo34WaXFEiHj8ckV0Xx
	 GqmRwxh6m4sCde1Vj87CyA8oUlLxELA33XpueV+4pXH5T4AyiCQWL+miE6lxvv11bR
	 e8WPInQqrb+8w==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: [PATCH v2 04/57] irqdomain.h: Stop using 'host' for domain
Date: Wed, 19 Mar 2025 10:28:57 +0100
Message-ID: <20250319092951.37667-5-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is confusing to see 'host' and 'domain' to be used as 'domain'. Given
this header is all about domains, switch the remaining 'host' uses to
'domain'.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---
 include/linux/irqdomain.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index e9ab95fbc5a9..bb7111105296 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -72,7 +72,7 @@ void of_phandle_args_to_fwspec(struct device_node *np, const u32 *args,
 
 /**
  * struct irq_domain_ops - Methods for irq_domain objects
- * @match: Match an interrupt controller device node to a host, returns
+ * @match: Match an interrupt controller device node to a domain, returns
  *         1 on a match
  * @select: Match an interrupt controller fw specification. It is more generic
  *	    than @match as it receives a complete struct irq_fwspec. Therefore,
@@ -454,7 +454,7 @@ static inline struct irq_domain *irq_domain_add_nomap(struct device_node *of_nod
 	return IS_ERR(d) ? NULL : d;
 }
 
-unsigned int irq_create_direct_mapping(struct irq_domain *host);
+unsigned int irq_create_direct_mapping(struct irq_domain *domain);
 #endif
 
 static inline struct irq_domain *irq_domain_add_tree(struct device_node *of_node,
@@ -507,7 +507,7 @@ static inline struct irq_domain *irq_domain_create_tree(struct fwnode_handle *fw
 	return IS_ERR(d) ? NULL : d;
 }
 
-void irq_domain_remove(struct irq_domain *host);
+void irq_domain_remove(struct irq_domain *domain);
 
 int irq_domain_associate(struct irq_domain *domain, unsigned int irq,
 			 irq_hw_number_t hwirq);
@@ -515,16 +515,16 @@ void irq_domain_associate_many(struct irq_domain *domain,
 			       unsigned int irq_base,
 			       irq_hw_number_t hwirq_base, int count);
 
-unsigned int irq_create_mapping_affinity(struct irq_domain *host,
+unsigned int irq_create_mapping_affinity(struct irq_domain *domain,
 					 irq_hw_number_t hwirq,
 					 const struct irq_affinity_desc *affinity);
 unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec);
 void irq_dispose_mapping(unsigned int virq);
 
-static inline unsigned int irq_create_mapping(struct irq_domain *host,
+static inline unsigned int irq_create_mapping(struct irq_domain *domain,
 					      irq_hw_number_t hwirq)
 {
-	return irq_create_mapping_affinity(host, hwirq, NULL);
+	return irq_create_mapping_affinity(domain, hwirq, NULL);
 }
 
 struct irq_desc *__irq_resolve_mapping(struct irq_domain *domain,
-- 
2.49.0


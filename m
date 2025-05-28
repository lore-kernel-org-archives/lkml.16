Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACEE21CC41
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462655; cv=none; b=Mni9UOXMy9+4l0V2Vl0JUcwBpZY3NZJnYglhcRDRbsQsRudLr9JxBDSao1NekXRsyGbYQDce/cf7mWEvdCRUhGDorIugTLZ/0xlMOlicHBjVIGSxQLI+zU9zKcvSplrp1gK2QvojYMQrvajOfC1Lm2hHo9UwazA83OI9gAK6zpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462655; c=relaxed/simple;
	bh=5cQO+L78pLKPYpwYs/yL4n0lRCh2JasU1lxwZ8R8b/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RRVzUsAMC1801QpGyVvH6iHmjkSJU3pRHfM/gNIt/hzGt/rRvV4xASjgvHcKPHFbdo5hXslvRwJiYDXkrQMnDq6+0bgv45bmbdpLCPXiZ+dAuvjp64CHB/He+Pd1GslvCXw+IA1jyKDU55PubKaUor6Wq4pF0LRdOKMkPrH9sJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qVYpWaak; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qVYpWaak"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73972a54919so90579b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748462652; x=1749067452; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N26Hic5+yJnYiyH/0mc17rp1cTeT3TWY7aBGNxZR5uI=;
        b=qVYpWaakoxUPyD3KZe2NG2RdcHdqg60rsXKfTOdSQ2bXHzaX/s7A7vvEGpaKB7tOBd
         1/UNPN2QqSVex+Rp9yOWhftzlJeRs8MwzHe2y5R07jy+Cn2VCuB35ND2oqIOGyqM+Aiv
         dK/LxQ1f6uss5faWuRqHGSQQaX7tfzFdWhksgW/ZOTrSg4mWnPAi6dscysiJFGi0Teyk
         ON9vhuD6iOMhSKfwFsQZcn8ED4w8e8NA2569BODBBcnfduS0yq1Q5dN1CDS8iVMss3aH
         qrnfa2XVWfElcMNLmjPUnj91OQCmKxTveBhEXRS/lGsyhIM93p9AUvgywFGEojqgoONl
         W9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462652; x=1749067452;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N26Hic5+yJnYiyH/0mc17rp1cTeT3TWY7aBGNxZR5uI=;
        b=eDPPdUw4UdnhRB42VsErJVCp8vcb0YpfiXEJ64SRnMwIADod9Q7XsyAu790mVxo+KX
         anLkqSOm+vZ/RcDWmmbxZ97uYReOGChIT6gaKPKzYRF2a3zytIE/J3PA25TNWqPPHPie
         YM2DHF0syMlaFhEOD9h2WA8poXVNyefaIAq4ik3Ov8FdwaKgMFidDCSGy35NKpIC4WhL
         Hz3vQ4vbOvyiX2XxBv8UIvuCGTJKlUtB9IqxaiJKNqhfi3+xvoYmGS4eepta6ADWXyw7
         qo2wN2UgzWnXmE2mw2silpZJpYz56c0mtFrUNUnS+P8UwA2R0xTwHW4i5jJvKATvNO+M
         VLFw==
X-Forwarded-Encrypted: i=1; AJvYcCUTYfSNi/huEM3v7/qgmrXmjTiwTVITSuXQIZfeSpjvDB96mjSr8wmlUK0PuvaRR4XybTNfA+P0O/ZJ4iE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJGmRhja+JVgW0cMK6tpu7k2Df1vuyPMctIHhcitHZiB3sQ51
	WjyuVEdZwvaSd1L9kRuIm8suJAQX1y1Mvzpb8bjYQ8Y9rcD4Z06aWYNLWwmF/EC9mMVUXmEdQya
	oJsJf0JoDDg==
X-Gm-Gg: ASbGnctA5u/0+vRay9y4y0cd12i7LXoPzcuSncBb5TbgPz/s3ZpOEmRMwz9F6Z1Zp1u
	qQMLKMsgB8p9hyTa12G7yB0YtxXcb3Dz6fvAGkLrebJAy8+P0YOXXRl5bY3ziCy5AnGRg6dwa5K
	ase334pA2LJOSEPwu+Ahhf1SaQMPl1YL9J2Q+/w783NoJKH3ERQaeuqZjNrZ3aJL8k9oXyGl/sF
	2wqe5hvbs6xd+jKq9Jk0K+woM/EOt2cS8VmzfpNzDcw0aOsh/aNc7Nu+iEIPtOeARmPhlCLNU51
	bdXldOH0EgHyqI6MIVt9p0ZApfTZLu+o1Nl8T7zjhk1oERjYNA==
X-Google-Smtp-Source: AGHT+IHl1uBTaNVAKk1dWKZ7RK+rWsbhvZBMzF0a11+N/7GdicJLFV9XxyGOLKPUxpEoTr7Cf/MDSg==
X-Received: by 2002:a17:90b:1dce:b0:311:c939:c848 with SMTP id 98e67ed59e1d1-311c939c979mr10628396a91.0.1748462652040;
        Wed, 28 May 2025 13:04:12 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3121b71c6fcsm30800a91.12.2025.05.28.13.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:04:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Date: Wed, 28 May 2025 13:03:43 -0700
Subject: [PATCH RFC] pmdomain: core: add hierarchy support for onecell
 providers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAB5sN2gC/x3MwQqDMAwA0F+RnBfQYjfZVdgHeB0eQhvXgLaSg
 kzEf7d4fJd3QGYVzvCuDlDeJEuKBc2jAhco/hjFF4Opja2t6XBdfFpIIgZhJXVhxxTZ8Twjtc+
 JfPvynbVQglV5kv+df2H49DCe5wUn5/NlcQAAAA==
X-Change-ID: 20250528-pmdomain-hierarchy-onecell-a46fad47d855
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=openpgp-sha256; l=8644; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=5cQO+L78pLKPYpwYs/yL4n0lRCh2JasU1lxwZ8R8b/Q=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBoN2w6JbEjJ8wJRjrtWWnjW0w/SYrHWc2fbit/N
 QgBbsPhyAuJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaDdsOgAKCRBZNxia0/vG
 ZaqWD/4phrMGZH0C5VSqI7RHowSonhUfCic/ghX8bby1CIL3dFbZB7y03GcNS8dqg7XB+ZTGCBp
 cf0+vaNkdaMH+sg7KNi36E2VtC22jExmB2PfLIqKFFYm+BHBY+qAcD89UjuMiGNEUkY8ptGOGw0
 /X+WubRNlLF6LAlSsKRhkrgxhk1eS6+ptuGLJUGoqJ5ylUVlgx2kgXwVbykn1VZbHEYwk/XhxNj
 XfGa1y9cqyD8ZQxuwS+7dPmm6+1Vvl0ij754oWFuxRaJScqrNU+KNRAyuz15y8Iw3RInWia/Lml
 2HANSV/eLQcqRGKZzWGALWUycxTu0cWlxcrGa56uDitf7rFR1BlqBmXuYitAxlg0kijK2uezV9g
 vSGSzlMPSp064CRLAtzdP8+Acn5sO9FBs3Ydxr8mLXslf/AcP92GK1pRC3sV6NLi5Upb/Lc912z
 I0+GXhgj05cmugQR7tfzH9BbLNHED4CsFmCBErmWAJijxOyu/J8OcLLHA1Lxz5EWMvP6fG2RLtM
 snuMPdVTl1e9afXShCm1n7kXni2cCgj8a/hzCil69n6MDWKM5oKl2b4cZYX1m0W1nGij74bFVII
 fdG1eFQLKV7JAQWubE2meZBxflGv8BsyerGYnMbfUOl8VQFAUMQCu+4OXTHxEzkWgha/2ek+KEH
 ILZBvp5SK6NxcBg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Currently, PM domains can only support hierarchy for simple
providers (e.g. ones with #power-domain-cells = 0).

Add support for oncell providers as well by adding a new property
`power-domains-child-ids` to describe the parent/child relationship.

For example, an SCMI PM domain provider might be a subdomain of
multiple parent domains. In this example, the parent domains are
MAIN_PD and WKUP_PD:

    scmi_pds: protocol@11 {
        reg = <0x11>;
        #power-domain-cells = <1>;
        power-domains = <&MAIN_PD>, <&WKUP_PD>;
        power-domains-child-ids = <15>, <19>;
    };

With the new property, child domain 15 (scmi_pds 15) becomes a
subdomain of MAIN_PD, and child domain 19 (scmi_pds 19) becomes a
subdomain of WKUP_PD.

Note: this idea was previously discussed on the arm-scmi mailing
list[1] where this approach was proposed by Ulf.  This is my initial
attempt at implementing it for discussion.  I'm definitely a noob at
adding support new DT properties, so I got some help from an AI friend
named Claude in writing this code, so feedback on the apprach is
welcomed.

[1] https://lore.kernel.org/arm-scmi/CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com/

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 Documentation/devicetree/bindings/power/power-domain.yaml |  39 ++++++++++++++++++++++++++++++++
 drivers/pmdomain/core.c                                   | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
index 8fdb529d560b..1db82013e407 100644
--- a/Documentation/devicetree/bindings/power/power-domain.yaml
+++ b/Documentation/devicetree/bindings/power/power-domain.yaml
@@ -68,6 +68,21 @@ properties:
       by the given provider should be subdomains of the domain specified
       by this binding.
 
+  power-domains-child-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      An array of child domain IDs that correspond to the power-domains
+      property. This property is only applicable to power domain providers
+      with #power-domain-cells > 0 (i.e., providers that supply multiple
+      power domains). It specifies which of the provider's child domains
+      should be associated with each parent domain listed in the power-domains
+      property. The number of elements in this array must match the number of
+      phandles in the power-domains property. Each element specifies the child
+      domain ID (index) that should be made a subdomain of the corresponding
+      parent domain. This enables hierarchical power domain structures where
+      different child domains from the same provider can have different
+      parent domains.
+
 required:
   - "#power-domain-cells"
 
@@ -133,3 +148,27 @@ examples:
             min-residency-us = <7000>;
         };
     };
+
+  - |
+    // Example of power-domains-child-ids usage
+    MAIN_PD: main-power-controller {
+        compatible = "foo,main-power-controller";
+        #power-domain-cells = <0>;
+    };
+
+    WKUP_PD: wkup-power-controller {
+        compatible = "foo,wkup-power-controller";
+        #power-domain-cells = <0>;
+    };
+
+    scmi_pds: protocol@11 {
+        reg = <0x11>;
+        #power-domain-cells = <1>;
+        power-domains = <&MAIN_PD>, <&WKUP_PD>;
+        power-domains-child-ids = <15>, <19>;
+    };
+
+    // In the above example:
+    // - Child domain 15 (scmi_pds 15) becomes a subdomain of MAIN_PD
+    // - Child domain 19 (scmi_pds 19) becomes a subdomain of WKUP_PD
+    // - Other child domains (0-14, 16-18, 20+) have no parent relationship
diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index d6c1ddb807b2..d9ae4f1d35ca 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2441,6 +2441,9 @@ static LIST_HEAD(of_genpd_providers);
 /* Mutex to protect the list above. */
 static DEFINE_MUTEX(of_genpd_mutex);
 
+static int of_genpd_parse_child_ids(struct device_node *np,
+				    struct genpd_onecell_data *data);
+
 /**
  * genpd_xlate_simple() - Xlate function for direct node-domain mapping
  * @genpdspec: OF phandle args to map into a PM domain
@@ -2635,6 +2638,14 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	if (ret < 0)
 		goto error;
 
+	/* Parse power-domains-child-ids property to establish parent-child relationships */
+	ret = of_genpd_parse_child_ids(np, data);
+	if (ret < 0 && ret != -ENOENT) {
+		pr_err("Failed to parse power-domains-child-ids for %pOF: %d\n", np, ret);
+		of_genpd_del_provider(np);
+		goto error;
+	}
+
 	return 0;
 
 error:
@@ -2734,6 +2745,106 @@ static struct generic_pm_domain *genpd_get_from_provider(
 	return genpd;
 }
 
+/**
+ * of_genpd_parse_child_ids() - Parse power-domains-child-ids property
+ * @np: Device node pointer associated with the PM domain provider.
+ * @data: Pointer to the onecell data associated with the PM domain provider.
+ *
+ * Parse the power-domains and power-domains-child-ids properties to establish
+ * parent-child relationships for PM domains. The power-domains property lists
+ * parent domains, and power-domains-child-ids lists which child domain IDs
+ * should be associated with each parent.
+ *
+ * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
+ */
+static int of_genpd_parse_child_ids(struct device_node *np,
+				    struct genpd_onecell_data *data)
+{
+	struct of_phandle_args parent_args;
+	struct generic_pm_domain *parent_genpd, *child_genpd;
+	u32 *child_ids;
+	int num_parents, num_child_ids, i, ret;
+
+	/* Check if both properties exist */
+	num_parents = of_count_phandle_with_args(np, "power-domains", "#power-domain-cells");
+	if (num_parents <= 0)
+		return -ENOENT;
+
+	num_child_ids = of_property_count_u32_elems(np, "power-domains-child-ids");
+	if (num_child_ids <= 0)
+		return -ENOENT;
+
+	if (num_parents != num_child_ids) {
+		pr_err("power-domains (%d) and power-domains-child-ids (%d) count mismatch for %pOF\n",
+		       num_parents, num_child_ids, np);
+		return -EINVAL;
+	}
+
+	child_ids = kcalloc(num_child_ids, sizeof(*child_ids), GFP_KERNEL);
+	if (!child_ids)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, "power-domains-child-ids", child_ids, num_child_ids);
+	if (ret) {
+		pr_err("Failed to read power-domains-child-ids for %pOF: %d\n", np, ret);
+		goto out_free;
+	}
+
+	/* For each parent domain, establish parent-child relationship */
+	for (i = 0; i < num_parents; i++) {
+		ret = of_parse_phandle_with_args(np, "power-domains",
+						 "#power-domain-cells", i, &parent_args);
+		if (ret) {
+			pr_err("Failed to parse parent domain %d for %pOF: %d\n", i, np, ret);
+			goto out_free;
+		}
+
+		/* Get the parent domain */
+		parent_genpd = genpd_get_from_provider(&parent_args);
+		of_node_put(parent_args.np);
+		if (IS_ERR(parent_genpd)) {
+			pr_err("Failed to get parent domain %d for %pOF: %ld\n",
+			       i, np, PTR_ERR(parent_genpd));
+			ret = PTR_ERR(parent_genpd);
+			goto out_free;
+		}
+
+		/* Validate child ID is within bounds */
+		if (child_ids[i] >= data->num_domains) {
+			pr_err("Child ID %u out of bounds (max %u) for parent %d in %pOF\n",
+			       child_ids[i], data->num_domains - 1, i, np);
+			ret = -EINVAL;
+			goto out_free;
+		}
+
+		/* Get the child domain */
+		child_genpd = data->domains[child_ids[i]];
+		if (!child_genpd) {
+			pr_err("Child domain %u is NULL for parent %d in %pOF\n",
+			       child_ids[i], i, np);
+			ret = -EINVAL;
+			goto out_free;
+		}
+
+		/* Establish parent-child relationship */
+		ret = genpd_add_subdomain(parent_genpd, child_genpd);
+		if (ret) {
+			pr_err("Failed to add child domain %u to parent %d in %pOF: %d\n",
+			       child_ids[i], i, np, ret);
+			goto out_free;
+		}
+
+		pr_debug("Added child domain %u (%s) to parent %s for %pOF\n",
+			 child_ids[i], child_genpd->name, parent_genpd->name, np);
+	}
+
+	ret = 0;
+
+out_free:
+	kfree(child_ids);
+	return ret;
+}
+
 /**
  * of_genpd_add_device() - Add a device to an I/O PM domain
  * @genpdspec: OF phandle args to use for look-up PM domain

---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250528-pmdomain-hierarchy-onecell-a46fad47d855

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


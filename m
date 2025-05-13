Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5482116F6
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747176023; cv=none; b=nPWgtlvlfMnOwj8pi7XdtLbB4tL0f6hs/sdDnD9sGFL7T8lN92sAl3hgTX/LO4m+aRteOmqLx/L5L9BJtk4NAcZgm9KMhJUKsDhDivuEzTdGwcSKOB0oVq/M2JBn1xHI8JPFdmyywiqfmmZYuxI8oqzOMEZhBN2LS/BB3Bk0EI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747176023; c=relaxed/simple;
	bh=d6pdZYRYGRbs/WEFIyypEGtUlCAolvymMF/KwvfNyRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References; b=Ja3OWxPChuWlkkRU/bPknh7cO1AC9fSM6RBhxC0WycaD1fshDtf6erLkKh23soVyxfBzuAb1Ob2nWlgcZwecbPjyoHf/8YMXQo65/TQCq23w9YJFXB1Uf27HKF1EndW0kdH+xLl+b8tDdiQBHSTbGXJ/9hXOzPo120loqG1oNoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=Y8nLf22J; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="Y8nLf22J"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-72c27166ab3so4418829a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747176020; x=1747780820;
        h=content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSXcNK9afbZfDS02iEQ039LRO1YK/rtmQ05CWBqOFLE=;
        b=vsPWxfN9774bUcGwth7IP+PO99mt67NisOs8rol9EiMt6wAHuZttooI+bWXMwjgbEX
         qsuGbnIMTMCCDORce+7QhON7KsSoqLlo23gccWD5+RzHPBrwveMsMGQY0NESKUcigEJE
         ynwoKD602gYdPfj/DvHF1n/2dlIkmfKmBL0d7KCW/nSFjYfhJvfYdHKxiPZHikia/fKY
         DxoSUU29CpZbVkj8njvoOBbUJTZessNxztbf55SVY1GesDrlgtA3A9HyEy27dm+PNNsc
         Ojzqw4E5QKW3z+oh+LHFKc47VypBO/qbDSV2pDAeQVTC8LM0heSsZEt2ITkY/cY5IzeV
         CYjg==
X-Forwarded-Encrypted: i=1; AJvYcCW3Bp9Vi51YDTQqhQA4RbP6OF1aIMtdwGi0se9qcaerYdxWSr8Ao5QPSBMbVzE2ZZTXAZ1GGPx3ta8Qavg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS13SmRxEyGmTomksIUrUhGRtXcMDyeZYcb+ukCqGc7pjYZ5di
	Fap3qXRIo8O7rlGmYfCMcXv0yMPDkFaJ8HLTaWMSEzcNx5fGtCmofjDzbZDKFDQ55AvJroBg5Gq
	CDLL1BR54bSghUaWAImSwisq6BbRavA==
X-Gm-Gg: ASbGnctfOajp9XAQEDZrjNJ3bvcK2bZQcEw/3etdNA84ju0JiwywbhAcaWVa/QCRrBd
	9JIv+klwCiuNJyLjTQ+wF5u7mV+b0CqOz/L/AqYyRBbFSWr5Y7xe1Ze/jKntNg0R4dPAQoteqGd
	R2/eq4ONaquiOCK/GwYU8utU0viUEznKzyL/F6CJUOXZ4GJGzpn0+yxITD7vZXHWVaHvilcJTZp
	GtQyU4HqI6UnJI2JbuzEP060PwhqeZmJC+AqKukyb3ntqJ+bRH0fnJWT1wFz3SsQBnKhitx1XUq
	5yR/r7yzK97rUnA5tzhvq+c=
X-Google-Smtp-Source: AGHT+IFw4unP4TtYCivnsEjLNivZRwen5oTYduVSjB3bBq5EZtnvuAolbMdZu0cxcPIEN54gp8SoPF72SJFn
X-Received: by 2002:a05:6830:6015:b0:72b:f997:19c4 with SMTP id 46e09a7af769-734e1579a25mr728416a34.26.1747176020382;
        Tue, 13 May 2025 15:40:20 -0700 (PDT)
Received: from smtp.aristanetworks.com ([74.123.28.25])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-732265b6624sm336246a34.11.2025.05.13.15.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 15:40:20 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1747176019;
	bh=RSXcNK9afbZfDS02iEQ039LRO1YK/rtmQ05CWBqOFLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y8nLf22JYSSZzUgIGcjeKAfu8JLFvmD7chCGdWHp0zh8t5XS8oQaRXDtROquAv3fy
	 nnIWd8zhH22TvPkDhOeygWMant5PK+UFtDAkDEefvAaqZfi5RPmdZtR2uE1yLJGxAU
	 dXuMVRMSPe6V1oAGCubGnm0pqVh7OGqJtd28RjUJPyPsl/CGzKqTXoOMQtg0LYhdWL
	 N/Gw9tEZNEYcqD/MsRD1ekaVEzrskDOtKYsISiZd2Lh5Si1FS44cCBkd8b1HEmmiyU
	 BZh2Q4v9+WjRFTLK4WgJiwu9u3NREdxMq2QzYkkIbEb5bGbHqnkLFB2Yf+U1zhm7v8
	 OHyBW9UaiEXTg==
Received: from mpazdan-home-zvfkk.localdomain (mpazdan-home-zvfkk.sjc.aristanetworks.com [10.244.171.242])
	by smtp.aristanetworks.com (Postfix) with ESMTP id 6CC5E10023F;
	Tue, 13 May 2025 22:40:19 +0000 (UTC)
Received: by mpazdan-home-zvfkk.localdomain (Postfix, from userid 91835)
	id 67FC940B24; Tue, 13 May 2025 22:40:19 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Marek Pazdan <mpazdan@arista.com>
To: andrew@lunn.ch
Cc: aleksander.lobakin@intel.com,
	almasrymina@google.com,
	andrew+netdev@lunn.ch,
	anthony.l.nguyen@intel.com,
	daniel.zahka@gmail.com,
	davem@davemloft.net,
	ecree.xilinx@gmail.com,
	edumazet@google.com,
	gal@nvidia.com,
	horms@kernel.org,
	intel-wired-lan@lists.osuosl.org,
	jianbol@nvidia.com,
	kory.maincent@bootlin.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	mpazdan@arista.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	przemyslaw.kitszel@intel.com,
	willemb@google.com
Subject: [Intel-wired-lan] [PATCH net-next v2 2/2] ice: add qsfp transceiver reset, interrupt and presence pin control
Date: Tue, 13 May 2025 22:40:01 +0000
Message-ID: <20250513224017.202236-2-mpazdan@arista.com>
In-Reply-To: <20250513224017.202236-1-mpazdan@arista.com>
References: <6f127b5b-77c6-4bd4-8124-8eea6a12ca61@lunn.ch>
 <20250513224017.202236-1-mpazdan@arista.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add get/set implenentation for ethtool's module management signal
API.
Examples:
ethtool --get-module-mgmt-signal eth16 type reset
reset: low

ethtool --get-module-mgmt-signal eth16 type int
reset: low

ethtool --get-module-mgmt-signal eth16 type present
reset: high

sudo ethtool --set-module-mgmt-signal eth16 type reset value high
ethtool --get-module-mgmt-signal eth16 type reset
reset: high

sudo ethtool --set-module-mgmt-signal eth16 type reset value low
ethtool --get-module-mgmt-signal eth16 type reset
reset: low

Ice driver gets link event notification when module gets restarted.
There is 'ice_handle_link_event' which handles the notification and
updates link status information.

Signed-off-by: Marek Pazdan <mpazdan@arista.com>
---
 drivers/net/ethernet/intel/ice/ice.h         |  6 ++
 drivers/net/ethernet/intel/ice/ice_common.c  | 21 +++++
 drivers/net/ethernet/intel/ice/ice_common.h  |  1 +
 drivers/net/ethernet/intel/ice/ice_ethtool.c | 94 ++++++++++++++++++++
 drivers/net/ethernet/intel/ice/ice_main.c    |  1 +
 drivers/net/ethernet/intel/ice/ice_type.h    |  2 +-
 6 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index fd083647c14a..3b95a69140e8 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -195,6 +195,12 @@
 
 #define ice_pf_src_tmr_owned(pf) ((pf)->hw.func_caps.ts_func_info.src_tmr_owned)
 
+enum ice_mgmt_pin {
+	ICE_MGMT_PIN_RESET = 0,
+	ICE_MGMT_PIN_INT,
+	ICE_MGMT_PIN_PRESENT
+};
+
 enum ice_feature {
 	ICE_F_DSCP,
 	ICE_F_PHY_RCLK,
diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
index 59df31c2c83f..2d643a7cc90f 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -6096,3 +6096,24 @@ u32 ice_get_link_speed(u16 index)
 
 	return ice_aq_to_link_speed[index];
 }
+
+/**
+ * ice_set_has_gpios - Sets availability of SDP GPIO pins.
+ * @hw: pointer to the HW structure
+ *
+ * This function sets availability of GPIO software defined pins
+ * (SDP) which are connected to transceiver slots and are used
+ * for transceiver control.
+ */
+bool ice_set_has_gpios(struct ice_hw *hw)
+{
+	if (hw->vendor_id != PCI_VENDOR_ID_INTEL)
+		return false;
+
+	switch (hw->device_id) {
+	case ICE_DEV_ID_E810C_QSFP:
+		return true;
+	default:
+		return false;
+	}
+}
diff --git a/drivers/net/ethernet/intel/ice/ice_common.h b/drivers/net/ethernet/intel/ice/ice_common.h
index 9b00aa0ddf10..b64629b1d60d 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.h
+++ b/drivers/net/ethernet/intel/ice/ice_common.h
@@ -304,4 +304,5 @@ ice_aq_write_i2c(struct ice_hw *hw, struct ice_aqc_link_topo_addr topo_addr,
 int ice_get_pca9575_handle(struct ice_hw *hw, u16 *pca9575_handle);
 int ice_read_pca9575_reg(struct ice_hw *hw, u8 offset, u8 *data);
 bool ice_fw_supports_report_dflt_cfg(struct ice_hw *hw);
+bool ice_set_has_gpios(struct ice_hw *hw);
 #endif /* _ICE_COMMON_H_ */
diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool.c b/drivers/net/ethernet/intel/ice/ice_ethtool.c
index 7c2dc347e4e5..bf6a803729d4 100644
--- a/drivers/net/ethernet/intel/ice/ice_ethtool.c
+++ b/drivers/net/ethernet/intel/ice/ice_ethtool.c
@@ -3848,6 +3848,96 @@ ice_get_channels(struct net_device *dev, struct ethtool_channels *ch)
 	ch->max_other = ch->other_count;
 }
 
+/**
+ * ice_get_module_mgmt_signal - get module management signal status
+ * @dev: network interface device structure
+ * @params: ethtool module management signal params
+ * @extack: extended ACK from the Netlink message
+ *
+ * Returns -EIO if AQ command for GPIO get failed, otherwise
+ * returns 0 and current status of requested signal in params.
+ */
+static int
+ice_get_module_mgmt_signal(struct net_device *dev,
+			   struct ethtool_module_mgmt_params *params,
+			   struct netlink_ext_ack *extack)
+{
+	struct ice_netdev_priv *np = netdev_priv(dev);
+	struct ice_pf *pf = np->vsi->back;
+	struct ice_hw *hw = &pf->hw;
+	u16 gpio_handle = 0; /* SOC/on-chip GPIO */
+	bool value;
+	int ret = 0;
+
+	if (hw->has_module_mgmt_gpio) {
+		switch (params->type) {
+		case ETHTOOL_MODULE_MGMT_RESET:
+			ret = ice_aq_get_gpio(hw, gpio_handle,
+					      ICE_MGMT_PIN_RESET, &value, NULL);
+			break;
+		case ETHTOOL_MODULE_MGMT_INT:
+			ret = ice_aq_get_gpio(hw, gpio_handle,
+					      ICE_MGMT_PIN_INT, &value, NULL);
+			break;
+		case ETHTOOL_MODULE_MGMT_PRESENT:
+			ret = ice_aq_get_gpio(hw, gpio_handle,
+					      ICE_MGMT_PIN_PRESENT, &value, NULL);
+			break;
+		default:
+			dev_dbg(ice_pf_to_dev(pf), "Incorrect management signal requested: %d\n",
+				params->type);
+			return -EINVAL;
+		}
+	} else {
+		return -EOPNOTSUPP;
+	}
+
+	if (ret == 0) {
+		params->value = value ? ETHTOOL_MODULE_MGMT_SIGNAL_HIGH :
+			ETHTOOL_MODULE_MGMT_SIGNAL_LOW;
+	}
+	return ret;
+}
+
+/**
+ * ice_set_module_mgmt_signal - set module management signal config
+ * @dev: network interface device structure
+ * @params: ethtool module management signal params
+ * @extack: extended ACK from the Netlink message
+ *
+ * Returns -EIO if AQ command for GPIO set failed, otherwise
+ * returns 0.
+ */
+static int
+ice_set_module_mgmt_signal(struct net_device *dev,
+			   const struct ethtool_module_mgmt_params *params,
+			   struct netlink_ext_ack *extack)
+{
+	struct ice_netdev_priv *np = netdev_priv(dev);
+	struct ice_pf *pf = np->vsi->back;
+	struct ice_hw *hw = &pf->hw;
+	u16 gpio_handle = 0; /* SOC/on-chip GPIO */
+	bool value = params->value == ETHTOOL_MODULE_MGMT_SIGNAL_HIGH ? true : false;
+	int ret = 0;
+
+	if (hw->has_module_mgmt_gpio) {
+		switch (params->type) {
+		case ETHTOOL_MODULE_MGMT_RESET:
+			ret = ice_aq_set_gpio(hw, gpio_handle,
+					      ICE_MGMT_PIN_RESET, value, NULL);
+			break;
+		default:
+			dev_dbg(ice_pf_to_dev(pf), "Incorrect management signal requested: %d\n",
+				params->type);
+			return -EINVAL;
+		}
+	} else {
+		return -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
 /**
  * ice_get_valid_rss_size - return valid number of RSS queues
  * @hw: pointer to the HW structure
@@ -4815,6 +4905,8 @@ static const struct ethtool_ops ice_ethtool_ops = {
 	.set_fecparam		= ice_set_fecparam,
 	.get_module_info	= ice_get_module_info,
 	.get_module_eeprom	= ice_get_module_eeprom,
+	.get_module_mgmt_signal	= ice_get_module_mgmt_signal,
+	.set_module_mgmt_signal = ice_set_module_mgmt_signal,
 };
 
 static const struct ethtool_ops ice_ethtool_safe_mode_ops = {
@@ -4837,6 +4929,8 @@ static const struct ethtool_ops ice_ethtool_safe_mode_ops = {
 	.set_ringparam		= ice_set_ringparam,
 	.nway_reset		= ice_nway_reset,
 	.get_channels		= ice_get_channels,
+	.get_module_mgmt_signal	= ice_get_module_mgmt_signal,
+	.set_module_mgmt_signal = ice_set_module_mgmt_signal,
 };
 
 /**
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index d390157b59fe..02b9809561e1 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -5294,6 +5294,7 @@ ice_probe(struct pci_dev *pdev, const struct pci_device_id __always_unused *ent)
 	hw->port_info = NULL;
 	hw->vendor_id = pdev->vendor;
 	hw->device_id = pdev->device;
+	hw->has_module_mgmt_gpio = ice_set_has_gpios(hw);
 	pci_read_config_byte(pdev, PCI_REVISION_ID, &hw->revision_id);
 	hw->subsystem_vendor_id = pdev->subsystem_vendor;
 	hw->subsystem_device_id = pdev->subsystem_device;
diff --git a/drivers/net/ethernet/intel/ice/ice_type.h b/drivers/net/ethernet/intel/ice/ice_type.h
index 0aab21113cc4..e88075ae4c8a 100644
--- a/drivers/net/ethernet/intel/ice/ice_type.h
+++ b/drivers/net/ethernet/intel/ice/ice_type.h
@@ -895,7 +895,7 @@ struct ice_hw {
 	u32 psm_clk_freq;
 	u64 debug_mask;		/* bitmap for debug mask */
 	enum ice_mac_type mac_type;
-
+	bool has_module_mgmt_gpio;	/* has GPIO for module management */
 	u16 fd_ctr_base;	/* FD counter base index */
 
 	/* pci info */
-- 
2.45.2


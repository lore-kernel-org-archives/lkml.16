Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EC11B4F1F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994791; cv=none; b=ZdvGW3Fm6dzaf59t6zL4rZWFPE2XrMFhL8baSIBZSwkAwMhhX40/Sb8FT0PMbFV4BBvOS3IpK4jsJlO/JQHIIgjzHWug8EDu7HhYt7G9Rl5WUDq/1XylBvYMfSWSFwLVfatInfaLPmpV29DyqXE0t4WpP+gMQTg8Y+H9gR3YXOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994791; c=relaxed/simple;
	bh=DFsQW41xHSC8vt0SuF+GZ2FzK8X9ND1Q4JSv/JwC968=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aGLFaHisFIHJlmH6NHku4X+wL76gP/oLP+zv7KaeRPWtttgAEEQp9wFQCALz0xvZAJa1DoTdunY0T4KUDTAn3/SX89nHIo6IZDT0gwNCTUH5ru4c0xFf3bOwfjJkEHVpW+3G2SD5TeNr2+zO/qOTGv6sh0h7k0+NWvEQoO6cTkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MaQjzsL1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MaQjzsL1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED90CC4CEE9;
	Fri, 23 May 2025 10:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747994790;
	bh=DFsQW41xHSC8vt0SuF+GZ2FzK8X9ND1Q4JSv/JwC968=;
	h=From:To:Cc:Subject:Date:From;
	b=MaQjzsL1UiCaON4wEdLbf3I2tIpo0jjihH0q5VpykOb2iyDCYthkIfIs/uEy53fq/
	 Y1IApEisxJmP9uAE3HkNG5QMKjpYxygmbsBXinLbfyWGVknNf4cIejyBph+DCjgM+c
	 4WoPi8lO6zOdhS6X8p2TDaHb0btojYz8p77MBz40=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] time/timecounter: fix the lie that struct cyclecounter is const
Date: Fri, 23 May 2025 12:06:22 +0200
Message-ID: <2025052321-plank-hardcopy-e895@gregkh>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=20005; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=DFsQW41xHSC8vt0SuF+GZ2FzK8X9ND1Q4JSv/JwC968=; b=owGbwMvMwCRo6H6F97bub03G02pJDBkGHnMDSlbaRisapDzjnfPh8uLX8lbuzBv7RLwO7PyyP tHUbtObjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZiIrx/DPIvgHpNrgjff/1ty Mzcwcd6EOVMy5Rjm18Z4+usVdT5N8dgpJjG/76DZcp3PAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

In both the read callback for struct cyclecounter, and in struct
timecounter, struct cyclecounter is declared as a const pointer.
Unfortunatly, a number of users of this pointer treat it as a non-const
pointer as it is burried in a larger structure that is heavily modified
by the callback function when accessed.  This lie had been hidden by the
fact that container_of() "casts away" a const attribute of a pointer
without any compiler warning happening at all.

Fix this all up by removing the const attribute in the needed places so
that everyone can see that the structure really isn't const, but can,
and is, modified by the users of it.

Cc: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/microblaze/kernel/timer.c                        | 2 +-
 drivers/clocksource/arm_arch_timer.c                  | 2 +-
 drivers/net/can/rockchip/rockchip_canfd-timestamp.c   | 2 +-
 drivers/net/can/spi/mcp251xfd/mcp251xfd-timestamp.c   | 2 +-
 drivers/net/can/usb/gs_usb.c                          | 2 +-
 drivers/net/dsa/mv88e6xxx/chip.h                      | 2 +-
 drivers/net/dsa/mv88e6xxx/ptp.c                       | 6 +++---
 drivers/net/ethernet/amd/xgbe/xgbe-ptp.c              | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c      | 2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c         | 2 +-
 drivers/net/ethernet/cavium/common/cavium_ptp.c       | 2 +-
 drivers/net/ethernet/freescale/fec_ptp.c              | 2 +-
 drivers/net/ethernet/intel/e1000e/netdev.c            | 2 +-
 drivers/net/ethernet/intel/igb/igb_ptp.c              | 4 ++--
 drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.c          | 4 ++--
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c | 2 +-
 drivers/net/ethernet/mellanox/mlx4/en_clock.c         | 2 +-
 drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c   | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c    | 2 +-
 drivers/net/ethernet/pensando/ionic/ionic_phc.c       | 2 +-
 drivers/net/ethernet/qlogic/qede/qede_ptp.c           | 2 +-
 drivers/net/ethernet/ti/cpts.c                        | 2 +-
 drivers/net/ethernet/wangxun/libwx/wx_ptp.c           | 2 +-
 drivers/ptp/ptp_mock.c                                | 2 +-
 drivers/ptp/ptp_vclock.c                              | 2 +-
 include/linux/timecounter.h                           | 6 +++---
 kernel/time/timecounter.c                             | 2 +-
 sound/hda/hdac_stream.c                               | 2 +-
 28 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/microblaze/kernel/timer.c b/arch/microblaze/kernel/timer.c
index 26c385582c3b..99a8334a4319 100644
--- a/arch/microblaze/kernel/timer.c
+++ b/arch/microblaze/kernel/timer.c
@@ -193,7 +193,7 @@ static struct timecounter xilinx_tc = {
 	.cc = NULL,
 };
 
-static u64 xilinx_cc_read(const struct cyclecounter *cc)
+static u64 xilinx_cc_read(struct cyclecounter *cc)
 {
 	return xilinx_read(NULL);
 }
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 981a578043a5..80ba6a54248c 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -243,7 +243,7 @@ static u64 arch_counter_read(struct clocksource *cs)
 	return arch_timer_read_counter();
 }
 
-static u64 arch_counter_read_cc(const struct cyclecounter *cc)
+static u64 arch_counter_read_cc(struct cyclecounter *cc)
 {
 	return arch_timer_read_counter();
 }
diff --git a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
index 43d4b5721812..a30bf0d1efdc 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
@@ -8,7 +8,7 @@
 
 #include "rockchip_canfd.h"
 
-static u64 rkcanfd_timestamp_read(const struct cyclecounter *cc)
+static u64 rkcanfd_timestamp_read(struct cyclecounter *cc)
 {
 	const struct rkcanfd_priv *priv = container_of(cc, struct rkcanfd_priv, cc);
 
diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd-timestamp.c b/drivers/net/can/spi/mcp251xfd/mcp251xfd-timestamp.c
index 202ca0d24d03..413a5cb75c13 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd-timestamp.c
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd-timestamp.c
@@ -11,7 +11,7 @@
 
 #include "mcp251xfd.h"
 
-static u64 mcp251xfd_timestamp_raw_read(const struct cyclecounter *cc)
+static u64 mcp251xfd_timestamp_raw_read(struct cyclecounter *cc)
 {
 	const struct mcp251xfd_priv *priv;
 	u32 ts_raw = 0;
diff --git a/drivers/net/can/usb/gs_usb.c b/drivers/net/can/usb/gs_usb.c
index 3ccac6781b98..9c6458ccc29b 100644
--- a/drivers/net/can/usb/gs_usb.c
+++ b/drivers/net/can/usb/gs_usb.c
@@ -420,7 +420,7 @@ static inline int gs_usb_get_timestamp(const struct gs_usb *parent,
 	return 0;
 }
 
-static u64 gs_usb_timestamp_read(const struct cyclecounter *cc) __must_hold(&dev->tc_lock)
+static u64 gs_usb_timestamp_read(struct cyclecounter *cc) __must_hold(&dev->tc_lock)
 {
 	struct gs_usb *parent = container_of(cc, struct gs_usb, cc);
 	u32 timestamp = 0;
diff --git a/drivers/net/dsa/mv88e6xxx/chip.h b/drivers/net/dsa/mv88e6xxx/chip.h
index 86bf113c9bfa..03caaceac939 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.h
+++ b/drivers/net/dsa/mv88e6xxx/chip.h
@@ -732,7 +732,7 @@ struct mv88e6xxx_avb_ops {
 };
 
 struct mv88e6xxx_ptp_ops {
-	u64 (*clock_read)(const struct cyclecounter *cc);
+	u64 (*clock_read)(struct cyclecounter *cc);
 	int (*ptp_enable)(struct ptp_clock_info *ptp,
 			  struct ptp_clock_request *rq, int on);
 	int (*ptp_verify)(struct ptp_clock_info *ptp, unsigned int pin,
diff --git a/drivers/net/dsa/mv88e6xxx/ptp.c b/drivers/net/dsa/mv88e6xxx/ptp.c
index aed4a4b07f34..991ae10e58f7 100644
--- a/drivers/net/dsa/mv88e6xxx/ptp.c
+++ b/drivers/net/dsa/mv88e6xxx/ptp.c
@@ -138,7 +138,7 @@ mv88e6xxx_cc_coeff_get(struct mv88e6xxx_chip *chip)
 	}
 }
 
-static u64 mv88e6352_ptp_clock_read(const struct cyclecounter *cc)
+static u64 mv88e6352_ptp_clock_read(struct cyclecounter *cc)
 {
 	struct mv88e6xxx_chip *chip = cc_to_chip(cc);
 	u16 phc_time[2];
@@ -152,7 +152,7 @@ static u64 mv88e6352_ptp_clock_read(const struct cyclecounter *cc)
 		return ((u32)phc_time[1] << 16) | phc_time[0];
 }
 
-static u64 mv88e6165_ptp_clock_read(const struct cyclecounter *cc)
+static u64 mv88e6165_ptp_clock_read(struct cyclecounter *cc)
 {
 	struct mv88e6xxx_chip *chip = cc_to_chip(cc);
 	u16 phc_time[2];
@@ -490,7 +490,7 @@ const struct mv88e6xxx_ptp_ops mv88e6390_ptp_ops = {
 		(1 << HWTSTAMP_FILTER_PTP_V2_DELAY_REQ),
 };
 
-static u64 mv88e6xxx_ptp_clock_read(const struct cyclecounter *cc)
+static u64 mv88e6xxx_ptp_clock_read(struct cyclecounter *cc)
 {
 	struct mv88e6xxx_chip *chip = cc_to_chip(cc);
 
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-ptp.c b/drivers/net/ethernet/amd/xgbe/xgbe-ptp.c
index 7051bd7cf6dc..fb32b444e3a3 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-ptp.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-ptp.c
@@ -122,7 +122,7 @@
 #include "xgbe.h"
 #include "xgbe-common.h"
 
-static u64 xgbe_cc_read(const struct cyclecounter *cc)
+static u64 xgbe_cc_read(struct cyclecounter *cc)
 {
 	struct xgbe_prv_data *pdata = container_of(cc,
 						   struct xgbe_prv_data,
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index f522ca8ff66b..98368a05dfcc 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -15176,7 +15176,7 @@ void bnx2x_set_rx_ts(struct bnx2x *bp, struct sk_buff *skb)
 }
 
 /* Read the PHC */
-static u64 bnx2x_cyclecounter_read(const struct cyclecounter *cc)
+static u64 bnx2x_cyclecounter_read(struct cyclecounter *cc)
 {
 	struct bnx2x *bp = container_of(cc, struct bnx2x, cyclecounter);
 	int port = BP_PORT(bp);
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c
index 2d4e19b96ee7..de2b5bf04d99 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c
@@ -702,7 +702,7 @@ static void bnxt_unmap_ptp_regs(struct bnxt *bp)
 		  (BNXT_PTP_GRC_WIN - 1) * 4);
 }
 
-static u64 bnxt_cc_read(const struct cyclecounter *cc)
+static u64 bnxt_cc_read(struct cyclecounter *cc)
 {
 	struct bnxt_ptp_cfg *ptp = container_of(cc, struct bnxt_ptp_cfg, cc);
 	u64 ns = 0;
diff --git a/drivers/net/ethernet/cavium/common/cavium_ptp.c b/drivers/net/ethernet/cavium/common/cavium_ptp.c
index 984f0dd7b62e..61e261657073 100644
--- a/drivers/net/ethernet/cavium/common/cavium_ptp.c
+++ b/drivers/net/ethernet/cavium/common/cavium_ptp.c
@@ -209,7 +209,7 @@ static int cavium_ptp_enable(struct ptp_clock_info *ptp_info,
 	return -EOPNOTSUPP;
 }
 
-static u64 cavium_ptp_cc_read(const struct cyclecounter *cc)
+static u64 cavium_ptp_cc_read(struct cyclecounter *cc)
 {
 	struct cavium_ptp *clock =
 		container_of(cc, struct cavium_ptp, cycle_counter);
diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 876d90832596..c28ca17a81fd 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -96,7 +96,7 @@
  * cyclecounter structure used to construct a ns counter from the
  * arbitrary fixed point registers
  */
-static u64 fec_ptp_read(const struct cyclecounter *cc)
+static u64 fec_ptp_read(struct cyclecounter *cc)
 {
 	struct fec_enet_private *fep =
 		container_of(cc, struct fec_enet_private, cc);
diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 8ebcb6a7d608..0d719f2f2612 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -4414,7 +4414,7 @@ u64 e1000e_read_systim(struct e1000_adapter *adapter,
  * e1000e_cyclecounter_read - read raw cycle counter (used by time counter)
  * @cc: cyclecounter structure
  **/
-static u64 e1000e_cyclecounter_read(const struct cyclecounter *cc)
+static u64 e1000e_cyclecounter_read(struct cyclecounter *cc)
 {
 	struct e1000_adapter *adapter = container_of(cc, struct e1000_adapter,
 						     cc);
diff --git a/drivers/net/ethernet/intel/igb/igb_ptp.c b/drivers/net/ethernet/intel/igb/igb_ptp.c
index f323e1c1989f..4bebd501971f 100644
--- a/drivers/net/ethernet/intel/igb/igb_ptp.c
+++ b/drivers/net/ethernet/intel/igb/igb_ptp.c
@@ -73,7 +73,7 @@ static void igb_ptp_tx_hwtstamp(struct igb_adapter *adapter);
 static void igb_ptp_sdp_init(struct igb_adapter *adapter);
 
 /* SYSTIM read access for the 82576 */
-static u64 igb_ptp_read_82576(const struct cyclecounter *cc)
+static u64 igb_ptp_read_82576(struct cyclecounter *cc)
 {
 	struct igb_adapter *igb = container_of(cc, struct igb_adapter, cc);
 	struct e1000_hw *hw = &igb->hw;
@@ -90,7 +90,7 @@ static u64 igb_ptp_read_82576(const struct cyclecounter *cc)
 }
 
 /* SYSTIM read access for the 82580 */
-static u64 igb_ptp_read_82580(const struct cyclecounter *cc)
+static u64 igb_ptp_read_82580(struct cyclecounter *cc)
 {
 	struct igb_adapter *igb = container_of(cc, struct igb_adapter, cc);
 	struct e1000_hw *hw = &igb->hw;
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.c
index eef25e11d938..eafb61415bd1 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.c
@@ -327,7 +327,7 @@ static void ixgbe_ptp_setup_sdp_X550(struct ixgbe_adapter *adapter)
  * result of SYSTIME is 32bits of "billions of cycles" and 32 bits of
  * "cycles", rather than seconds and nanoseconds.
  */
-static u64 ixgbe_ptp_read_X550(const struct cyclecounter *cc)
+static u64 ixgbe_ptp_read_X550(struct cyclecounter *cc)
 {
 	struct ixgbe_adapter *adapter =
 		container_of(cc, struct ixgbe_adapter, hw_cc);
@@ -364,7 +364,7 @@ static u64 ixgbe_ptp_read_X550(const struct cyclecounter *cc)
  * cyclecounter structure used to construct a ns counter from the
  * arbitrary fixed point registers
  */
-static u64 ixgbe_ptp_read_82599(const struct cyclecounter *cc)
+static u64 ixgbe_ptp_read_82599(struct cyclecounter *cc)
 {
 	struct ixgbe_adapter *adapter =
 		container_of(cc, struct ixgbe_adapter, hw_cc);
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c
index 63130ba37e9d..e52cc6b1a26c 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c
@@ -193,7 +193,7 @@ static int ptp_pps_on(struct otx2_ptp *ptp, int on, u64 period)
 	return otx2_sync_mbox_msg(&ptp->nic->mbox);
 }
 
-static u64 ptp_cc_read(const struct cyclecounter *cc)
+static u64 ptp_cc_read(struct cyclecounter *cc)
 {
 	struct otx2_ptp *ptp = container_of(cc, struct otx2_ptp, cycle_counter);
 
diff --git a/drivers/net/ethernet/mellanox/mlx4/en_clock.c b/drivers/net/ethernet/mellanox/mlx4/en_clock.c
index cd754cd76bde..49d6a82d04bb 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_clock.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_clock.c
@@ -38,7 +38,7 @@
 
 /* mlx4_en_read_clock - read raw cycle counter (to be used by time counter)
  */
-static u64 mlx4_en_read_clock(const struct cyclecounter *tc)
+static u64 mlx4_en_read_clock(struct cyclecounter *tc)
 {
 	struct mlx4_en_dev *mdev =
 		container_of(tc, struct mlx4_en_dev, cycles);
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c b/drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c
index 65a94e46edcf..6c38aa3c4cae 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c
@@ -343,7 +343,7 @@ static u64 mlx5_read_time(struct mlx5_core_dev *dev,
 			   (u64)timer_l | (u64)timer_h1 << 32;
 }
 
-static u64 read_internal_timer(const struct cyclecounter *cc)
+static u64 read_internal_timer(struct cyclecounter *cc)
 {
 	struct mlx5_timer *timer = container_of(cc, struct mlx5_timer, cycles);
 	struct mlx5_clock *clock = container_of(timer, struct mlx5_clock, timer);
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c
index ca8b9d18fbb9..d21c6076950c 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c
@@ -131,7 +131,7 @@ static u64 __mlxsw_sp1_ptp_read_frc(struct mlxsw_sp1_ptp_clock *clock,
 	return (u64) frc_l | (u64) frc_h2 << 32;
 }
 
-static u64 mlxsw_sp1_ptp_read_frc(const struct cyclecounter *cc)
+static u64 mlxsw_sp1_ptp_read_frc(struct cyclecounter *cc)
 {
 	struct mlxsw_sp1_ptp_clock *clock =
 		container_of(cc, struct mlxsw_sp1_ptp_clock, cycles);
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_phc.c b/drivers/net/ethernet/pensando/ionic/ionic_phc.c
index 7505efdff8e9..9f5c81d44f99 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_phc.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_phc.c
@@ -290,7 +290,7 @@ static u64 ionic_hwstamp_read(struct ionic *ionic,
 	return (u64)tick_low | ((u64)tick_high << 32);
 }
 
-static u64 ionic_cc_read(const struct cyclecounter *cc)
+static u64 ionic_cc_read(struct cyclecounter *cc)
 {
 	struct ionic_phc *phc = container_of(cc, struct ionic_phc, cc);
 	struct ionic *ionic = phc->lif->ionic;
diff --git a/drivers/net/ethernet/qlogic/qede/qede_ptp.c b/drivers/net/ethernet/qlogic/qede/qede_ptp.c
index 9d6399a5c780..a38f1e72c62b 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_ptp.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_ptp.c
@@ -181,7 +181,7 @@ static void qede_ptp_task(struct work_struct *work)
 }
 
 /* Read the PHC. This API is invoked with ptp_lock held. */
-static u64 qede_ptp_read_cc(const struct cyclecounter *cc)
+static u64 qede_ptp_read_cc(struct cyclecounter *cc)
 {
 	struct qede_dev *edev;
 	struct qede_ptp *ptp;
diff --git a/drivers/net/ethernet/ti/cpts.c b/drivers/net/ethernet/ti/cpts.c
index dbbea9146040..2ba4c8795d60 100644
--- a/drivers/net/ethernet/ti/cpts.c
+++ b/drivers/net/ethernet/ti/cpts.c
@@ -181,7 +181,7 @@ void cpts_misc_interrupt(struct cpts *cpts)
 }
 EXPORT_SYMBOL_GPL(cpts_misc_interrupt);
 
-static u64 cpts_systim_read(const struct cyclecounter *cc)
+static u64 cpts_systim_read(struct cyclecounter *cc)
 {
 	struct cpts *cpts = container_of(cc, struct cpts, cc);
 
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_ptp.c b/drivers/net/ethernet/wangxun/libwx/wx_ptp.c
index 07c015ba338f..ec188adfab6f 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_ptp.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_ptp.c
@@ -638,7 +638,7 @@ static int wx_ptp_set_timestamp_mode(struct wx *wx,
 	return 0;
 }
 
-static u64 wx_ptp_read(const struct cyclecounter *hw_cc)
+static u64 wx_ptp_read(struct cyclecounter *hw_cc)
 {
 	struct wx *wx = container_of(hw_cc, struct wx, hw_cc);
 
diff --git a/drivers/ptp/ptp_mock.c b/drivers/ptp/ptp_mock.c
index e7b459c846a2..bbd14ce24b34 100644
--- a/drivers/ptp/ptp_mock.c
+++ b/drivers/ptp/ptp_mock.c
@@ -41,7 +41,7 @@ struct mock_phc {
 	spinlock_t lock;
 };
 
-static u64 mock_phc_cc_read(const struct cyclecounter *cc)
+static u64 mock_phc_cc_read(struct cyclecounter *cc)
 {
 	return ktime_get_raw_ns();
 }
diff --git a/drivers/ptp/ptp_vclock.c b/drivers/ptp/ptp_vclock.c
index 7febfdcbde8b..2fdeedd60e21 100644
--- a/drivers/ptp/ptp_vclock.c
+++ b/drivers/ptp/ptp_vclock.c
@@ -164,7 +164,7 @@ static const struct ptp_clock_info ptp_vclock_info = {
 	.do_aux_work	= ptp_vclock_refresh,
 };
 
-static u64 ptp_vclock_read(const struct cyclecounter *cc)
+static u64 ptp_vclock_read(struct cyclecounter *cc)
 {
 	struct ptp_vclock *vclock = cc_to_vclock(cc);
 	struct ptp_clock *ptp = vclock->pclock;
diff --git a/include/linux/timecounter.h b/include/linux/timecounter.h
index 0982d1d52b24..dce03a5cafb7 100644
--- a/include/linux/timecounter.h
+++ b/include/linux/timecounter.h
@@ -28,7 +28,7 @@
  * @shift:		cycle to nanosecond divisor (power of two)
  */
 struct cyclecounter {
-	u64 (*read)(const struct cyclecounter *cc);
+	u64 (*read)(struct cyclecounter *cc);
 	u64 mask;
 	u32 mult;
 	u32 shift;
@@ -53,7 +53,7 @@ struct cyclecounter {
  * @frac:		accumulated fractional nanoseconds
  */
 struct timecounter {
-	const struct cyclecounter *cc;
+	struct cyclecounter *cc;
 	u64 cycle_last;
 	u64 nsec;
 	u64 mask;
@@ -100,7 +100,7 @@ static inline void timecounter_adjtime(struct timecounter *tc, s64 delta)
  * the time stamp counter by the number of elapsed nanoseconds.
  */
 extern void timecounter_init(struct timecounter *tc,
-			     const struct cyclecounter *cc,
+			     struct cyclecounter *cc,
 			     u64 start_tstamp);
 
 /**
diff --git a/kernel/time/timecounter.c b/kernel/time/timecounter.c
index e6285288d765..3d2a354cfe1c 100644
--- a/kernel/time/timecounter.c
+++ b/kernel/time/timecounter.c
@@ -6,7 +6,7 @@
 #include <linux/timecounter.h>
 
 void timecounter_init(struct timecounter *tc,
-		      const struct cyclecounter *cc,
+		      struct cyclecounter *cc,
 		      u64 start_tstamp)
 {
 	tc->cc = cc;
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 4e85a838ad7e..9d5be87ea1e0 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -634,7 +634,7 @@ int snd_hdac_stream_set_params(struct hdac_stream *azx_dev,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_set_params);
 
-static u64 azx_cc_read(const struct cyclecounter *cc)
+static u64 azx_cc_read(struct cyclecounter *cc)
 {
 	struct hdac_stream *azx_dev = container_of(cc, struct hdac_stream, cc);
 
-- 
2.49.0


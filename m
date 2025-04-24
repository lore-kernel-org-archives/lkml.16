Received: from pop36.abv.bg (pop36.abv.bg [194.153.145.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322CA1A841C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.153.145.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745508273; cv=none; b=HqhLecapaZ608hqEFm00MHxd0YoE5bLVsKRSuSqEugO47xr2iqiECyUxzH/46zicuyV9HDzYpSD/lsizgrHgw30BMuGdfgXc98V6h6oQ0fTfm09DP6q5Sko2hBNFlIj82AbHMiPyBW4x1FNGI/zhcITLLv+Cj4S+PDVmSYFop3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745508273; c=relaxed/simple;
	bh=r9WvBOzO9ub9cvnpN+Vt2Llv1rg9QEbN9Ah6Hd3dmog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qkAroVrUvK5GpwufyWPEc2R+t34NhCM/jaVXxBGyM+WU7VWa66/EMAGJMtd0beaqS/ymaflujG4CnWZRkFkMjlzFEdFTSNiJEB81cyUKD7A8q+M1tgtjyuNKw/D2MiVh0jTmwLCh6+pTbXTE/riGmmYzU+5MSyTylUuemn5dCJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=abv.bg; spf=pass smtp.mailfrom=abv.bg; dkim=pass (1024-bit key) header.d=abv.bg header.i=@abv.bg header.b=I8pMzi8/; arc=none smtp.client-ip=194.153.145.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=abv.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abv.bg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=abv.bg header.i=@abv.bg header.b="I8pMzi8/"
Received: from smtp.abv.bg (localhost [127.0.0.1])
	by pop36.abv.bg (Postfix) with ESMTP id 6B4C91805D2D;
	Thu, 24 Apr 2025 18:14:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abv.bg; s=smtp-out;
	t=1745507696; bh=MPc9jSI1zCl6BTdIscu6ybN1aJS6kPg8y/OMmaKXouI=;
	h=Date:From:To:Cc:Subject:From;
	b=I8pMzi8/zHh5bNJGwhoMxzJiVcHML1GBgsIK7eGdSFX9xuyebQNayivyvD9YR5lbs
	 V0qgliH47GWcprFXGtP5M996bKEbT2htoowfrDpU8BuONA/AZY/lXpdCcx1gt2mwy1
	 RssQamanLsZF90fVP+2O6d76EYThn375EJW5Avow=
X-HELO: laptop
Authentication-Results: smtp.abv.bg; auth=pass (login) smtp.auth=ivan.shamliev.dev@abv.bg
Received: from pop-144.92.escom.bg (HELO laptop) (93.183.144.92)
 by smtp.abv.bg (qpsmtpd/0.96) with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted); Thu, 24 Apr 2025 18:14:56 +0300
Date: Thu, 24 Apr 2025 18:14:53 +0300
From: Ivan Shamliev <ivan.shamliev.dev@abv.bg>
To: austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ivan.shamliev.dev@abv.bg
Subject: [PATCH] drm/amd/display: Use true/false for boolean variables in
 DML2 core files
Message-ID: <20250424181453.3f78a2a9@laptop>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

=46rom 694c017112d176af07c2a65f015a8e73d6895e81 Mon Sep 17 00:00:00 2001
From: Ivan Shamliev <ivan.shamliev.dev@abv.bg>
Date: Thu, 24 Apr 2025 11:00:08 +0300
Subject: [PATCH] drm/amd/display: Use true/false for boolean variables in D=
ML2
 core files

Replace 0 and 1 with false and true for boolean variables in
dml2_core_dcn4_calcs.c and dml2_core_utils.c to align with the Linux
kernel coding style guidelines, which recommend using C99 bool type
with true/false values.

Signed-off-by: Ivan Shamliev <ivan.shamliev.dev@abv.bg>
---
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c   | 16 ++++++++--------
 .../dml2/dml21/src/dml2_core/dml2_core_utils.c   |  8 ++++----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_c=
ore_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/=
dml2_core_dcn4_calcs.c
index 4c504cb0e1c5..c299fe4b3b74 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn=
4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn=
4_calcs.c
@@ -4962,11 +4962,11 @@ static double get_urgent_bandwidth_required(
 		l->adj_factor_cur_pre =3D UrgentBurstFactorCursorPre[k];
=20
 		bool is_phantom =3D dml_is_phantom_pipe(&display_cfg->plane_descriptors[=
k]);
-		bool exclude_this_plane =3D 0;
+		bool exclude_this_plane =3D false;
=20
 		// Exclude phantom pipe in bw calculation for non svp prefetch state
 		if (state_type !=3D dml2_core_internal_soc_state_svp_prefetch && is_phan=
tom)
-			exclude_this_plane =3D 1;
+			exclude_this_plane =3D true;
=20
 		// The qualified row bandwidth, qual_row_bw, accounts for the regular no=
n-flip row bandwidth when there is no possible immediate flip or HostVM inv=
alidation flip.
 		// The qual_row_bw is zero if HostVM is possible and only non-zero and e=
qual to row_bw(i) if immediate flip is not allowed for that pipe.
@@ -7163,13 +7163,13 @@ static unsigned int get_qos_param_index(unsigned lo=
ng uclk_freq_khz, const struc
 static unsigned int get_active_min_uclk_dpm_index(unsigned long uclk_freq_=
khz, const struct dml2_soc_state_table *clk_table)
 {
 	unsigned int i;
-	bool clk_entry_found =3D 0;
+	bool clk_entry_found =3D false;
=20
 	for (i =3D 0; i < clk_table->uclk.num_clk_values; i++) {
 		dml2_printf("DML::%s: clk_table.uclk.clk_values_khz[%d] =3D %d\n", __fun=
c__, i, clk_table->uclk.clk_values_khz[i]);
=20
 		if (uclk_freq_khz =3D=3D clk_table->uclk.clk_values_khz[i]) {
-			clk_entry_found =3D 1;
+			clk_entry_found =3D true;
 			break;
 		}
 	}
@@ -8502,7 +8502,7 @@ static bool dml_core_mode_support(struct dml2_core_ca=
lcs_mode_support_ex *in_out
=20
 	for (k =3D 0; k < mode_lib->ms.num_active_planes; ++k) {
 		double line_time_us =3D (double)display_cfg->stream_descriptors[display_=
cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_c=
fg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timi=
ng.pixel_clock_khz / 1000);
-		bool cursor_not_enough_urgent_latency_hiding =3D 0;
+		bool cursor_not_enough_urgent_latency_hiding =3D false;
=20
 		if (display_cfg->plane_descriptors[k].cursor.num_cursors > 0) {
 			calculate_cursor_req_attributes(
@@ -11097,7 +11097,7 @@ static bool dml_core_mode_programming(struct dml2_c=
ore_calcs_mode_programming_ex
 		mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_laten=
cy_margin);
=20
 	for (k =3D 0; k < s->num_active_planes; ++k) {
-		bool cursor_not_enough_urgent_latency_hiding =3D 0;
+		bool cursor_not_enough_urgent_latency_hiding =3D false;
 		s->line_times[k] =3D display_cfg->stream_descriptors[display_cfg->plane_=
descriptors[k].stream_index].timing.h_total /
 			((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors=
[k].stream_index].timing.pixel_clock_khz / 1000);
=20
@@ -12199,10 +12199,10 @@ void dml2_core_calcs_get_dpte_row_height(
=20
 static bool is_dual_plane(enum dml2_source_format_class source_format)
 {
-	bool ret_val =3D 0;
+	bool ret_val =3D false;
=20
 	if ((source_format =3D=3D dml2_420_12) || (source_format =3D=3D dml2_420_=
8) || (source_format =3D=3D dml2_420_10) || (source_format =3D=3D dml2_rgbe=
_alpha))
-		ret_val =3D 1;
+		ret_val =3D true;
=20
 	return ret_val;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_c=
ore_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_=
core_utils.c
index 2504d9c2ec34..215fd80cdc8d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_uti=
ls.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_uti=
ls.c
@@ -533,13 +533,13 @@ unsigned int dml2_core_utils_get_qos_param_index(unsi=
gned long uclk_freq_khz, co
 unsigned int dml2_core_utils_get_active_min_uclk_dpm_index(unsigned long u=
clk_freq_khz, const struct dml2_soc_state_table *clk_table)
 {
 	unsigned int i;
-	bool clk_entry_found =3D 0;
+	bool clk_entry_found =3D false;
=20
 	for (i =3D 0; i < clk_table->uclk.num_clk_values; i++) {
 		dml2_printf("DML::%s: clk_table.uclk.clk_values_khz[%d] =3D %d\n", __fun=
c__, i, clk_table->uclk.clk_values_khz[i]);
=20
 		if (uclk_freq_khz =3D=3D clk_table->uclk.clk_values_khz[i]) {
-			clk_entry_found =3D 1;
+			clk_entry_found =3D true;
 			break;
 		}
 	}
@@ -555,10 +555,10 @@ unsigned int dml2_core_utils_get_active_min_uclk_dpm_=
index(unsigned long uclk_fr
=20
 bool dml2_core_utils_is_dual_plane(enum dml2_source_format_class source_fo=
rmat)
 {
-	bool ret_val =3D 0;
+	bool ret_val =3D false;
=20
 	if (dml2_core_utils_is_420(source_format) || dml2_core_utils_is_422_plana=
r(source_format) || (source_format =3D=3D dml2_rgbe_alpha))
-		ret_val =3D 1;
+		ret_val =3D true;
=20
 	return ret_val;
 }
--=20
2.43.0


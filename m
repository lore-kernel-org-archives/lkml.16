Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E585223DD7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578916; cv=none; b=TEihSOx4O0tSOwmFSHPRcKSJAhnceVtZZJrBJRZDWos033JI2q17CwTnax2MrmlQxV25sVctePd8Ufhd6VO3ei1xbYL3FNB1elxlaKHAe3zaZHVshxSn8PN6/Q556jn1mG5f5MKO/07CIfWqE/1vlud9/AcYy1rNZ406DIEbEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578916; c=relaxed/simple;
	bh=rnb9O5ga+vC0Au9mvXeMxO85sgNKSlUDQVe/FRuj+pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWbQXbZYUliQNyhfX4P6WVFtvxUOtf9E21y9c61RXnwc+vhT/1f6UVddvZxAmyVMRyaUD6xS86Mxdqfrii6TLfj0LVL8k1mW5K2i1bCtBkz7n6DNOg1eRXZCBq9ROvuUDs7pjUILDFmCqPHyRsGrllLs8/anqt2AlIjdiCT/fcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Sb5sk5Uf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Sb5sk5Uf"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D0B4D77;
	Fri, 25 Apr 2025 13:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578909;
	bh=rnb9O5ga+vC0Au9mvXeMxO85sgNKSlUDQVe/FRuj+pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sb5sk5UfxD8qmpaDvvbR8Zj2LskR6jJ/A81uOBgRMzGIOWA11mW0zyk7ktESrTQOf
	 AFoypnmTrZ+D4mlLzkr3M8YZ7IbtSCSLlZknCd+OfHGoURCBD+setx5nR+jgJfd5Ij
	 WIGOVnyh7Z81JUk8SFSEHIHnq1eUsU1n3B4r+nmI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:21 +0300
Subject: [PATCH v5 01/11] drm/fourcc: Add warning for bad bpp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-1-c74263231630@ideasonboard.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
In-Reply-To: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=rnb9O5ga+vC0Au9mvXeMxO85sgNKSlUDQVe/FRuj+pw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2uZ0gF4l87mnADMNdl5nDKdXbrZmaM0UJsBZ
 nn/PG/33qyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrmQAKCRD6PaqMvJYe
 9Sy4EACfOqlwgpKfB2i0IryEotLvaFuW3Vsa/n6owJ+Cy6FdOSjkBe/UzlkXbYeydjXKMtC4rns
 /GtNGv24JPp0U0y+H0mrClDhJ1JzoMIgePNzYS4DTMhTF6sivKSaBJ9KzFKZfqsjk/wT5vcaLpj
 GTNqt5x9Cx/cJ6aEgjTkRrsZkH26o6TKWsz0hQ7DkyTds+saH55Jogs0cTFeIl7VkOFjnkXHaLf
 o/nwxNfhBhElZLDADT85Y/qqd5FrtKpn5WktN2hBm6EeLWVT8DQtWN16BYv3+vMJK7hvEBKTWT6
 fDlNLCSn9Tqw+42pzzs9pxtrIaCUBSNpnS3shDLBYBl4YlnXqdfn5vQ0z40in6P8EIrwpPqxVk/
 LcV4RGhL3K8sUL6i2VHsy8KpCNUSyHXvU+i6YxpW1or7qJ/Bqa4v87/pIlbi6uTC86vh/m0m/gf
 j6bcSZSLMcDoWJO4uDbH9xOyePLqSIw80cEDzTdkR3t3uE4B2qDFaepxOnwNOjGs7hBF1zxL9n9
 ALqL5zO55qJhhWjCH1UqKXjCgAOJAQD5s5zdqlJyF5NgLTU7cVF4AfqDbxjpLv5YHnggFnER1JH
 gMuYwFeU/PqpnFEQknFuhN9cL/wQ4ZDV3H5BT0E4yLEaOkXSeyAHyhHtUnW+BwMsUxYK2cCXLL2
 fCkagyUYKiKH2OA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

drm_format_info_bpp() cannot be used for formats which do not have an
integer bits-per-pixel in a pixel block.

E.g. DRM_FORMAT_XV15's (not yet in upstream) plane 0 has three 10-bit
pixels (Y components), and two padding bits, in a 4 byte block. That is
10.666... bits per pixel when considering the whole 4 byte block, which
is what drm_format_info_bpp() does. Thus a driver that supports such
formats cannot use drm_format_info_bpp(),

It is a driver bug if this happens, but so handle wrong calls by
printing a warning and returning 0.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 3a94ca211f9c..2f5781f5dcda 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -454,12 +454,20 @@ EXPORT_SYMBOL(drm_format_info_block_height);
  */
 unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
 {
+	unsigned int block_size;
+
 	if (!info || plane < 0 || plane >= info->num_planes)
 		return 0;
 
-	return info->char_per_block[plane] * 8 /
-	       (drm_format_info_block_width(info, plane) *
-		drm_format_info_block_height(info, plane));
+	block_size = drm_format_info_block_width(info, plane) *
+		     drm_format_info_block_height(info, plane);
+
+	if (info->char_per_block[plane] * 8 % block_size) {
+		pr_warn("unable to return an integer bpp\n");
+		return 0;
+	}
+
+	return info->char_per_block[plane] * 8 / block_size;
 }
 EXPORT_SYMBOL(drm_format_info_bpp);
 

-- 
2.43.0


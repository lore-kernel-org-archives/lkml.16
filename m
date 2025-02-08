Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C922083;
	Sat,  8 Feb 2025 00:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738976261; cv=none; b=clYVFg2m5V6mZ6wdwIir9XNHoPDib5M78H5Cg9erIye5TOPVzydTIsswXCFmd9mbosN4K2HLaXUUCc3G8Oj3KGP/PzUiphXpTauEJxROxZBWjnIOxYZAwrim0BDKFsfFEJBi+zQEqgoN9/lEC68GeO0W09Sv/jMLYrPTns+rISk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738976261; c=relaxed/simple;
	bh=s73gZJxfX7iVi8/axmemQ97Af5OiileiiR6qZEjP2BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NeRdNgOyLSLzZucLBh6rXZDIrVlitYZYQ5E/TkPsJevBiy1T1FxOgAJY/2+YAL1XbjSn+X9XpxTZra/0kUSr8+NfzTjdINay6Hflgq+Va+9yTVLJ1GxmRwHpzYWeoW0qrQk0/at2y89Pqlq0H/K1atT87DNVGY68WrhcAP9UT7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgWOie+n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgWOie+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BDFC4CED1;
	Sat,  8 Feb 2025 00:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738976260;
	bh=s73gZJxfX7iVi8/axmemQ97Af5OiileiiR6qZEjP2BY=;
	h=From:Date:Subject:To:Cc:From;
	b=UgWOie+nV/w5MHjfIyZVNXRRMtN0egvNSHkoSKlCmEzwFKYnkwE9S52vsHohMxjwy
	 OVbGUaPBD8YB+W0I+UAuAJmeACBiBAmN41Ub5/U1dhDuN8grx+S1cscgDplOKchBzm
	 a0RIeR/FfzmoBecKrPVmk2JZx4aLi6P3+0GzBITtPPESpRK1SgPWbrQs/jk9GtWcDQ
	 9Ai8pb98G4AZcIhi6HKCRpPgwOLRP7G+aIF1G1psUpDq3STUzoVu9D9Q+E3GcWZuD+
	 UDaXNJSMIDYPW/JymJeWQJ6neV0U07U+PjJPRKb9Z20GDzpKRE8p3f3vM1UfDx5eyZ
	 7CTQLd0YSp4zg==
From: broonie@kernel.org
Date: Sat, 08 Feb 2025 00:57:22 +0000
Subject: [PATCH] ASoC: ops: Enforce platform maximum on initial value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250208-asoc-volume-limit-v1-1-b98fcf4cdbad@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPGrpmcC/x3MTQqAIBBA4avIrBswoR+6SrQwG2sgNbQiCO+et
 PwW772QKDIlGMQLkW5OHHxBXQkwm/YrIS/FoKRqpJId6hQM3mG/HOHOjk/spZ7JNH1nWwulOyJ
 Zfv7nOOX8AepZ7LpjAAAA
X-Change-ID: 20250207-asoc-volume-limit-80abec587f6f
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.orG>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W7gblHwYyBsGKJUh8awKI7dmFF5nq/+ls3lP70bR1lU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnpqwBZBJOVyeLaY6KQ/kqarxAeuyup456Vkfew
 uV2PKFXjNGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6asAQAKCRAk1otyXVSH
 0MSUB/4izCFMmyPs/Fx6FCeh8Ehm/M73+9hGzRDW4irqXZHi3w9etCbZuhUYRhMIaqEgRUwZDe3
 oqonEMGI1/vDwpvlbS3tJJPL1hfgx7u4G+HI7oRC8DiaYJbJDLO2QFkN355gCvVS2RVR52r/mpg
 O3HupDPaMzHobaZm7yRZLqGfl/f/igKvQX6r95nh04hXsuJsSf7pk19FTcGOQUIJ+zjQJhYwHlf
 6dh/QQD2xsS9D0rrL3SJnsNyukGk5yiN83VBQlRppJzWsA+UJCu8ekpHEYaJgDMEqiYUAXdUNeJ
 ByYwBJDGy/3gi1WcbyeJtssL2fk+Uze5WRVMFO9In8RBKnFa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Martin Povišer <povik+lin@cutebit.org>

Lower the volume if it is violating the platform maximum at its initial
value (i.e. at the time of the 'snd_soc_limit_volume' call).

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
[Cherry picked from the Asahi kernel with fixups -- broonie]
Signed-off-by: Mark Brown <broonie@kernel.orG>
---
 sound/soc/soc-ops.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 19928f098d8d..4d63dd0b0d0f 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -640,6 +640,33 @@ int snd_soc_get_volsw_range(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_volsw_range);
 
+static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+	struct snd_ctl_elem_value uctl;
+	int ret;
+
+	if (!mc->platform_max)
+		return 0;
+
+	ret = kctl->get(kctl, &uctl);
+	if (ret < 0)
+		return ret;
+
+	if (uctl.value.integer.value[0] > mc->platform_max)
+		uctl.value.integer.value[0] = mc->platform_max;
+
+	if (snd_soc_volsw_is_stereo(mc) &&
+	    uctl.value.integer.value[1] > mc->platform_max)
+		uctl.value.integer.value[1] = mc->platform_max;
+
+	ret = kctl->put(kctl, &uctl);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 /**
  * snd_soc_limit_volume - Set new limit to an existing volume control.
  *
@@ -664,7 +691,7 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 		struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
 		if (max <= mc->max - mc->min) {
 			mc->platform_max = max;
-			ret = 0;
+			ret = snd_soc_clip_to_platform_max(kctl);
 		}
 	}
 	return ret;

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-asoc-volume-limit-80abec587f6f

Best regards,
-- 
Mark Brown <broonie@kernel.org>


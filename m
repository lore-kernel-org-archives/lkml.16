Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D426E1BC41;
	Thu, 27 Mar 2025 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081630; cv=none; b=DXoyBIWF9Vj81LdT9/TEzKx8vMVq39JKk3K9QfQN5tCyGsS+c/hlmlInIPa6oiLS5uRqdeahccRNhsPpSuJ6hbW10NpnH9FtV1V38ZZ3hjWLj112hN2oou0hjxMA8+2CvZMq1Dv/iWQu6okae26NTa9B9/aaUWH9MRjI8UJNlKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081630; c=relaxed/simple;
	bh=RZlULOmRSXzlznSkXKkt2dyMZh6NjO5+8VE5CdR4Cig=;
	h=From:To:Cc:Subject:Date:Message-Id; b=mRUirzvguBD8YMUA4GxzeUPjqrkycfAJ+/L4GwCi0BCzc4NSTJ7nbXvoDGm6JFSHDZv/uNJK9GIUJECAbK7wRsQZ21z5iS3jBMhPJoc1NC1giSCzDXcNee6SVPOC9eVQ22Eas3yLaejORtiO2CKWFCD+MQdw3HSAUjNZu8QwIhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=h0uEd2wR; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="h0uEd2wR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=6s+FIweNHSsPmtC+D3
	07TvTFIK5mhHg+DJ5XJ/ZuodE=; b=h0uEd2wRqxn+EwTA5kZB77+LLZQz3pEXXT
	ZTK4OelfX42+sBQZDx2hJ5IoNNBZGn4mAayHzF0UjYf1IWSo8EqYoTbGmo1+rRYX
	yaXG60AB9GIPAOL5dXO4zUpBRI5+9r1dG2CThbsZhdxJX52R8s0Db23ZpG25CnLo
	cQUp79vaI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3f7xtUOVn1ekMCQ--.39600S2;
	Thu, 27 Mar 2025 21:19:43 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	jdelvare@suse.com,
	christophe.jaillet@wanadoo.fr
Cc: Wenliang Yan <wenliang202407@163.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4]  hwmon:(ina238)Add support for SQ52206
Date: Thu, 27 Mar 2025 09:18:37 -0400
Message-Id: <20250327131841.15013-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3f7xtUOVn1ekMCQ--.39600S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF1UXw1kAFWkZFyftF1xGrg_yoW5GFykp3
	yfCF95Wr98Jr17XrZIkr4I9r1rW3WkJF18Ww1xJw1Fv3W5uFy0v3y2kr45Ca1DtrZxZFZ8
	ta4SgFn7Kr17ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR_pn9UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbBDQUd02flUB4G0QAAsd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add support for Silergy i2c power monitor SQ52206 to the ina238
driver as those two are similar.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---

Add new chip SQ52206, the datasheet depends on 
https://us1.silergy.com/cloud/index/uniqid/676b659b4a503
The password is fx6NEe.

Changes in v6:
- Split the patch and explain in detail how the formula changes and the reasons for adding content.
- Link to v5: https://lore.kernel.org/linux-hwmon/20250313075501.5435-1-wenliang202407@163.com/

Changes in v5:
- Add the description of change log in PATCH 0 and PATCH 2.
- Link to v4: https://lore.kernel.org/linux-hwmon/20250125030300.1230967-1-wenliang202407@163.com/

Changes in v4:
- Add 'Acked-by: Krzysztof Kozlowski' information to PATCH 1.

- Formatting adjustments have been made to ina2xx.c in PATCH 2.
Including:
1.Change 'sprintf()' in the 'energy1_input_show()' to 'sysfs_emit()'.
2.Move up the "enum ina238_ids chip" line in the 'ina238_probe()' to keep RCT style.
3.Remove the last comma when describing 'ina238_of_match[]' to keep the
format consistent with the 'i2c_device_id ina238_id[]' structure.
4.Change the '5bytes' in the description to '5 bytes'.

- Link to v3: https://lore.kernel.org/linux-hwmon/20250117082017.688212-1-wenliang202407@163.com/

Changes in v3:
- Add the description of the different features of SQ52206 in the ina2xx.yaml(PATCH 1).

- Change program logic errors in ina238.c(PATCH 2).
Including:
1.Change 'break' to 'return 0' after 'if (has_power_highest)'.
2.Add {} after 'if (chip == sq52206)' in 'ina238_probe(struct i2c_client *client)'.
3.Change 'data->config->has_energy ? NULL : ina238_groups' to 
'data->config->has_energy ? ina238_groups : NULL'

- Link to v2: https://lore.kernel.org/linux-hwmon/20250113035023.365697-1-wenliang202407@163.com/

Changes in v2:
- Explain why sq52206 compatibility has been added to ina2xx.yaml.

- addressed various review comments.

- Link to v1: https://lore.kernel.org/linux-hwmon/20241224063559.391061-1-wenliang202407@163.com/

Wenliang Yan (4):
  hwmon:(ina238)Add ina238_config to save configurations for different
    chips
  hwmon:(ina238)Add support for SQ52206
  hwmon:(ina238)Modify the calculation formula to adapt to different
    chips
  dt-bindings:Add SQ52206 to ina2xx devicetree bindings

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   5 +
 Documentation/hwmon/ina238.rst                |  15 ++
 drivers/hwmon/ina238.c                        | 211 +++++++++++++++---
 3 files changed, 198 insertions(+), 33 deletions(-)

-- 
2.17.1


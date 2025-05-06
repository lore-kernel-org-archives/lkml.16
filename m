Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE5828FFE5;
	Tue,  6 May 2025 05:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746509953; cv=none; b=lbZ6ngEnkgVmtoUzW3FVUJuRo66JAwcwLisepOC4LewEBcBhU4OFBT3BIeRtaBZa7oVnY7LPyasyG9OChlnES3pwq3z86Asy47xeNnRQ5puS0LfREBpECOh6YxjD4JNZx9d0sHxlj/925M7osi86QORsg5ksXGU9Rma0EeAWd+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746509953; c=relaxed/simple;
	bh=04094zyspNSRtg8USfAABByNKw3qw1PdaemydQ7+VOQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=qkrXGGQ7ImRVzxLTpiHFii3P0Bya1jaJnjoUZI7orjchjdqNgg1jzR5jR8KjHaU6704nDvejsDq2Pk/gTQCZhBgaLgScsXrWZ1ZZnmBJBnALzFGFJRLz50DjJSqISq9DzvHdwAxTtY/IdRgGRIIf43RJPMABQlJTaquP3DiXdwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SelWjaF+; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SelWjaF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=SD3ZuwBOYac4wfrQfn
	qfNDjWyHTA4zEWUmnB4zwmEZo=; b=SelWjaF+H11jq/7K3qSHj4V3Z1LLHGjWDY
	VIZ+AhBJvJM8suOYacd3VHM8DzpxcyysyHOygRlL2+Knivr1jzSwEnJ8XeBkt+RS
	94Oa4FMqxg9ljWCenNCNPLAjScsNShi4uOwlawfYVZfU1N5PivGfwaeQBMdO7wXh
	k0AHJCCcI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBHxSpEoBloZ2M1Ew--.50689S2;
	Tue, 06 May 2025 13:38:14 +0800 (CST)
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
	linux-kernel@vger.kernel.org,
	derek.lin@silergycorp.com,
	miguel.lee@silergycorp.com,
	chris.ho@silergycorp.com,
	eason.liao@silergycorp.com
Subject: [PATCH v7 0/4]  hwmon:(ina238)Add support for SQ52206
Date: Tue,  6 May 2025 01:37:37 -0400
Message-Id: <20250506053741.4837-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wBHxSpEoBloZ2M1Ew--.50689S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF18Zr17Ar4fKFyUCF4DJwb_yoW5Xw4kp3
	yfCFZ5Wr98Gr17XrZIkr4I9r1rW3WkJF18Ww1xJw1Fva45ZF10v3yIkr4Yya1DtrZxZFZ8
	ta4SqFn7KF17ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR_uctUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbibgNF02gZnfc1tAAAsh
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

Changes in v7:
- Modify the yaml file in PATCH 4
- Link to v6: https://lore.kernel.org/linux-hwmon/20250327131841.15013-1-wenliang202407@163.com/

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


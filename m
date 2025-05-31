Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16591EDA02;
	Sat, 31 May 2025 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694452; cv=none; b=dcF31j7W/M1nrsAhMwwocgomFdSjRlP91chMMRowf8mTGiVIg0jO783XDHQ7BGfLACWFvocZ3KZfw9J/B56SNOWBCLu5K9OY66rzHY2UrM4IRJQWtuw3VW9t00pAXcNwn9jQbZIF+kf3sYSHsFm14mJ0YmbWTG3dejtUm6cgCwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694452; c=relaxed/simple;
	bh=Ncxe6chc0002MMyRlneAVwpJpUu4Ar6EKfMAWZOg24s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qkTl19bKvdcIzYN85LwtUW+0VpxUE0J5JeYcFeKvbReV5XRM7n++pkj/+cvBBqjzxwr2xKtaPbLUzIbUxwILtHmjb7MRnnfm3spjsTd011CJIdOt1szFgtT5lzm7MzM1Mp7S8l5/q4AkJaBb00KVOmRrgxDJRjW5/Fmu3SjT9ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orS+MvcS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orS+MvcS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9381BC4CEE3;
	Sat, 31 May 2025 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748694452;
	bh=Ncxe6chc0002MMyRlneAVwpJpUu4Ar6EKfMAWZOg24s=;
	h=From:Subject:Date:To:Cc:From;
	b=orS+MvcS5/y5G2YhaHeeitTKxaxZh2EXIKJ+vK3bFRpTuc5ckuF1bKLokdVenUGLS
	 zivDVEl4+4kJfLwAf/UR6AoLQr7/BWrpAqatEPNkehhSsXgUrXTBYdkzXGiIZT1jzV
	 unhPNnl6OWeFUiDjJOqKjXl4yJVrgcOu/OUiMqEzWiWoJD466Xo7vxKMfePBxxevER
	 CPqwqnXQ84j98sfJMvDMENNbW9p2I5HiUsu9NmGETe5tRu/xo7ydobEfK81dXrf029
	 ScgHrWUbNM4y4vP2fhFQgQuGMNL8dCc0PB46lRYRu9aZmyXSQ/FXP7kwZZwVkw6203
	 Lli+qsocHziOw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/5] Add missing OPP tables for Venus on qcom/arm64
Date: Sat, 31 May 2025 14:27:18 +0200
Message-Id: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKb1OmgC/x3MTQqAIBBA4avErBO0P6urRIjVWLNIRSuC6O5Jy
 2/x3gMRA2GEPnsg4EWRnE0QeQbzpu2KjJZkKHhR87oU7HCeZnahPaNy3isd9qZipWyxayfTcCk
 gtT6gofv/DuP7fhiXYV9nAAAA
X-Change-ID: 20250531-topic-venus_opp_arm64-378e98bf6071
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748694447; l=1066;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Ncxe6chc0002MMyRlneAVwpJpUu4Ar6EKfMAWZOg24s=;
 b=Ve9i0EBxqU+t5OZ/Dukz5MVHUM1UYtfsifnpLRhW5vtP4C067ExW2zxbcUq8ged/06sYhmb4I
 EIhZ5UtLxZoBlyV8kNHkP1qxcZKVt07DSoOA7HeApiq061Gq5Ypo30V
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Sparked by <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>

No external dependencies

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (5):
      arm64: dts: qcom: msm8916: Add Venus OPP table
      arm64: dts: qcom: msm8996: Add Venus OPP table
      arm64: dts: qcom: msm8998: Add Venus OPP table
      arm64: dts: qcom: sdm630: Add Venus OPP table
      arm64: dts: qcom: sdm845: Fix Venus OPP entries

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 20 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 39 ++++++++++++++++++++++++++++-------
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 30 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 35 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 24 ++++++++++-----------
 5 files changed, 128 insertions(+), 20 deletions(-)
---
base-commit: 2a628f951ed54c30a232230b5b58349d2a8dbb11
change-id: 20250531-topic-venus_opp_arm64-378e98bf6071

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


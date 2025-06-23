Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2FB221F1E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665005; cv=none; b=tOH9XSZ4cr3QeyqaLZydqd+k6XneMFuu91VsnpRhqfXaqACqqSWI+xAZwwKJkPvqcdZaelNmymqgb8XHKKPtLvqd9OkICWY2W/mXsHnTKt5yEcys60HSCqC97d0FUg7MWq5pwIhh5zCB+xm9cQA+v66Y5LS6lpxw/WqJaz9wJ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665005; c=relaxed/simple;
	bh=Nn1SUHbdtz+bHl8aKw5FbLQmxNDmU9kBm/3nok286Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qkpJryCn1UKwv+AnqTzAWJFV8ca1JpYi/4Bgcs3NlRimDLREwnEbwFTzHeKZUuTu++fid3D4eN4aJdq+whH4o+G0zREGhB6XTEKwCRbFBIYy5TNiyCMbVrThW9RelcLLjMhi/OFPj4qOcpMg0LKEBgbbCMhvWHpuZ2V/4Ml1hfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBez9FuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBez9FuS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4dYiS015169
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jQR+8/Rp8f5
	ejzW/Cs4Zyl6AAG5h3mREu2uxrmhGHwM=; b=EBez9FuSEVbHFpoqoUqxiFce1Pt
	/9GhnirYjPfI3CNpTeMzlBO76W/EbZpFFVZYs12I/8heO65FP7OZ5YhuQ6E4LdF9
	k/DxdsPyPlGPKOvsCDvrM279RwmfRKGvom1/11LyQO2BFFDvsvAQAhbWzxjYzO7c
	ZnZG/2sSsfv2npB21neTTjeeqx64/lGFHZuGHBxoKpD4q/5XwYUFgpEE9u8tYjro
	7qQjQaI8nHQrd+Ex6DGpq4QxkhALfS4k+THR4v9tNhMOhGpu0pQwg6IXDu0TtYge
	6lyZHe5JIMHWDc4RG65llPXC9kTTdhq3ksZFG2yhYEHtNvf0F258FGn5eNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f03b0g9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:50:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40f335529so160110585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665000; x=1751269800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQR+8/Rp8f5ejzW/Cs4Zyl6AAG5h3mREu2uxrmhGHwM=;
        b=mjzno6LckkGqwNynak4hexx9eTNXqk3CBgSV+tq4eofQ2Ig/JkDsHL2JwAM2HRdg+i
         5YJp3ShJjoNYjIugC4f/zdXlaMlQRf55PsXsQSd3L1PT3M4QA/vv0vRJqnw1bNC94IGh
         aZXLtI5FShQw5HT/oiszYq0bAh6thJl9hxzWpxLQ+h3y3FXR/tktZQPmqAoJCmDk4svR
         YEdLwyRTU9oRxUK5QHWoickj7gVXrJDfGMoF41gXsWGfeMYntk30xkXMJiCXDso65hvg
         IqVB1GKpskUTDoWSzZ8OKtJxfE/DEwy3gtLSLkNeTeK+twZt5/As2s4inmPyY7Gv/sA4
         SeaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkrumpmg+n1zWblZylA4zPDV13poVK9D2DlyJhEVIkH8KvSDPKNoONWAjaIntdIstxtQYbp3i56lc4yZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4r3IIe48l2r+EX1n0O5OmP4m7V7aNkcERXS/wQXA4Rp8g5Mmc
	glR+8oE9W2C8OG6HLoI8EwO5YUHImpyjD1nyH6MHtfmaz2csxEC1THhkE9jul775J+MZzqMPlM0
	IfsCKpqidNqEHk/oxnDchi8rjZhY3QvLFqoao0c7/7Z/iCY1p8SE2GhDXAS+U2eJVaR0=
X-Gm-Gg: ASbGnctpEE0fJ6KqTmRFm7UUXVoJ3k31/tEzlarWXGTI3zWBasWePetuJrOO3/I3xYB
	fjZTyHbdgdPK3x4r4oGpOEYmXKhVPFmAl6CP+5HlBHppd8MbF+4CWc16ESTugImayLEAxDASXwW
	iKAZXElezyLaBmoAnhSkVBsGze2iLAWLYAUunyXN8H8iMG87LXeCtSrQDIUNHEgGuwLe/diUgFj
	KY63xeUvOIEAxM/K8aEkQP2ArCYgrLH6tPckeBXowWug4aXaoj7B7WEcw+WXK6w5Zk2HMTZwxlV
	Zh+/BsWdnvsgl2K9lGKsauqp57HuI7EkHKflvYQ6NZUatcHqVa+KnQ0BqPL2LN5NxwY+SZ3Shss
	X
X-Received: by 2002:a05:620a:460d:b0:7d3:e648:5f5 with SMTP id af79cd13be357-7d3fbf760acmr1548209685a.1.1750665000178;
        Mon, 23 Jun 2025 00:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbmKUcg/kFZe3QXuKKB+2EpQOW/AczTl6L69ib3vwtTOg8rRVszsHDWIaLVlARzjyBpTaLQA==
X-Received: by 2002:a05:620a:460d:b0:7d3:e648:5f5 with SMTP id af79cd13be357-7d3fbf760acmr1548207285a.1.1750664999780;
        Mon, 23 Jun 2025 00:49:59 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17ac7sm8755313f8f.23.2025.06.23.00.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:49:59 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Date: Mon, 23 Jun 2025 09:49:40 +0200
Message-Id: <20250623074940.3445115-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6pP3AO-2d8XasZj0Gd4e5amDc3kqzcNo
X-Proofpoint-GUID: 6pP3AO-2d8XasZj0Gd4e5amDc3kqzcNo
X-Authority-Analysis: v=2.4 cv=CPUqXQrD c=1 sm=1 tr=0 ts=68590729 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6cNYJS_lEeBOaWCNo2sA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfX4qcb7uLoqWEL
 AxbWyFSr9Hq7LpQEF7XnHdB7RX7HzdhoQupFJhXVztBM3bgJUdk4dTKYI5eLIWHh3izdwrZDQgV
 bomyC+EZzq2mkMnKgxU+LCmqa76khTNa9U7bLrXK4bKXtmRlPEUv7yL3+SKYmjfGd0s70Yp7Iqa
 oo9rOrn86Yq7xvLIkWiYkBQpq2/m74vyBCkNPrS1/2H+E/2obRUC5PZc57W2vqSO9wjQ64WK/K0
 TDYRhC6MdBDMfO3c8HhtS6s8hAfQRtTjems/Z3be9fxLDb1K22NeRrQPgQ94Pf3UoVfw4runsAq
 GS8knO0b/K5u4HUk6Ofv7PS+3uQ52AOwDvXVxc3KGWM76HET28ZOLNzgLd/kpzLlQpz16wKgp8Z
 02aDa2C7ql2y8/B4Ghue6Uf1atykENKGR4Gvz3xljTvI05XCxcUmXEIX6ufNn9LrZsxhHJhO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230045

Add DT entries for the qcm2290 venus encoder/decoder.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..b7e789d1f639 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,51 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,qcm2290-venus";
+			reg = <0 0x5a00000 0 0xff000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus", "vcodec0", "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core", "iface", "bus", "throttle",
+				      "vcodec0_core", "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0x861 0x04>,
+				 <&apps_smmu 0x863 0x0>,
+				 <&apps_smmu 0x804 0xE0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
+					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+			interconnect-names = "video-mem", "cpu-cfg";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+				opp-133000000 {
+					opp-hz = /bits/ 64 <133000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1


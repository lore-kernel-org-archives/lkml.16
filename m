Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B262750FB
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627268; cv=none; b=MLvJp9RN8S9UHv94/TRL4rf/Ly9rLfbnyQ7PwO1MShe6dkN5+tCqx8O8wOkSmYdukvY8m8iY49NNYS0yoTpY+UmZ8hzv+RVYIn93sLefYx01p0qBXyn5uvggSF+pqAEGtBzfYSJFmZFpx3SxO1gTKchn0nDQkktpCiL72ytiQhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627268; c=relaxed/simple;
	bh=wtNBVObtJLZWFz34xNAcXaCgoS4pdtkSWPvWnWYjv30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/1lk5L4t0HH+LcDLuP2ryWRhphLHpOdHEOa8gDQR3oYRfD8/vDTHebHyeSBsTqkzxHnehk6raFVfFKK1JAQ7FJVV7cySIxAlg3GiTMqwCsQ/DKVI6/uqbplB7XukQq81BccCIiz71WtLZLGkj2/GIw/t+AsfPNM5Mx+cnvIrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLvuOCyq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLvuOCyq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAKL9d009757
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G3Yaqy14zRsDj/Izz9GTItYivVNTdDctP3/IaDWEKC8=; b=FLvuOCyqwowbjxsp
	yBk8vn5Sb1CkQ9OqQ/c3/gQWkWbn2Hia9PPIm0Ebc5BQvtUOcseAd/J4UK05Iq25
	jxo2avGTqcL3DcijyLXC+KeVKPWAvEoaCSjhmKE5A2jOwSLin+35hJ2zPWdhGdZJ
	nH87I7y4JLJwDElm7f/lhOlfYi0+sIzqmD5x3Jqpf/pr7+v9+n5veQ8RIJYWu/ab
	3wSkorySUWquBnxVQ1Wi5Vx6og4pMvLQvQe3QDPa4nDSZ/0MyKuv1dzmTW8vY8jy
	/FoT/DEISvDHyFc6/xcGQuTCx1xNHxRi7+1TToScl5xpsK+i+VC/JhV0tpyZtRSR
	P/JobQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691mmcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:47:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311f4f2e761so2366015a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627264; x=1749232064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3Yaqy14zRsDj/Izz9GTItYivVNTdDctP3/IaDWEKC8=;
        b=bUClJNMgL40RTce/NmFPXWTIIzmTtBF0zH/TBgprnmGub6XExlTJb3KDKWCqoSwh7T
         TwhEfDNTBJS2c7myd1rv6uUkxE7fp6t09kLMwgpCR6osu01TwGYjqKEuvv+hWrKMlT7U
         EUu1ZdUW5e4jWbEn9yB6uXOkVVhRzQN6js1jWm1GRFIBO427FvFp5b9wvabch3HsYXZb
         FcOeubcXX+dqMd7QCYrEtxiyhx2xRcd5STlXR1xWfy6LE3Ddg93DPRyyC5VhlgDgivHw
         pVeHFuN3VpfvKrGRtPtAmQnRzkiFNfrzHg0RFU27mFuIiMj044qkZE5tMy9EaNDk9ja1
         JuAg==
X-Forwarded-Encrypted: i=1; AJvYcCVScMKW51LWPq1jdJD655ASUZjZ5WiuIsTksA1iIMwF8IY4HUKQ2BM/WNdgWM8GqVoJ22I+VLfnNrL6bw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCpZlkjFTVOyfcK7YZAijY4+FhIjKBMFKoLFuZaeYKZr57IyMB
	y8zgME/TbBPIyRMLFA0yZWRow7ziqWCiiYbM3wxIs3ZRLtAqRbNcR3ixEI8Y+fP7+gZssKODRmr
	zifTe/5c+64OWmEvJJIPEEtS9o3hCvCztcWMktzi3Bq8n6I2XJuoyP8lj9AbvjuLsnuCaG0zx+F
	I=
X-Gm-Gg: ASbGncvYAotR5jKNZRocLP0s14KsioeYbSNrU9TG609pinFDagRJ/FMaDDSRnmgPj0k
	LHhLvtHBihkK+6fNaoioFKneB1TB8xbFL7mYF0qK2ySxE6KNhpMfumcfP5Xyyv26XNv4nKYJbm9
	blUTsdN9kKyuL3RSnGJaYQW4DT2t6Tm3v2CQzS/4TjNW2VyZM0TsdVdLLEu9ffyl3yNEkrI84zL
	1b0vc2jnt1I1SLFLKpFW3i40RXlCgEYlaXAF2syEIRBR0ziq4DTDGqgDSlm2Q8a2PSMjQD0t5Ep
	gXoOqABlQwznvsVuoq5/+RChHHKcUXsLa0GVwunvVMn4jeSLTqhTIHXHttMCI5X3u9RrTtsW
X-Received: by 2002:a17:90b:54ce:b0:311:e731:523a with SMTP id 98e67ed59e1d1-31241532eb7mr7091883a91.11.1748627264429;
        Fri, 30 May 2025 10:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtRyWpC+3J4vARPUxNqzxp7BkyRVcIjF8pzurxuAfBXAhl/rjeV8CUFFYkLjSxulswmYqtTg==
X-Received: by 2002:a17:90b:54ce:b0:311:e731:523a with SMTP id 98e67ed59e1d1-31241532eb7mr7091826a91.11.1748627263967;
        Fri, 30 May 2025 10:47:43 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:47:43 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:24 -0700
Subject: [PATCH v2 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-1-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=2367;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=7Nf93rJk1Jau571xR4KogJtaiOBtO9isp+SwjgHQiMA=;
 b=/V8/oYxYroVmei3jP22ho13u9RU9te5O8gMSJvS2fsv5LzCmRzxuZ7SWGvcuaJNzLm5NDHvH6
 Z+SX6xZyosxCjhFzne33X5dJrRH6cXF1LJw0ZmHLBJgAd87nGUHIeH7
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6839ef41 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=l8kPDwqpA12hi6-TC14A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: o2-m8rxwhWQSe2kpfoomt_pd64-hFZJa
X-Proofpoint-ORIG-GUID: o2-m8rxwhWQSe2kpfoomt_pd64-hFZJa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX+HddwV25PPWL
 Jfz8UK71drArzeOJmaQTuNb/xLzzgShTPM6iSls+x7SikadaC7yQOB32s4W2IpH0xTsDXuVNYiv
 tPIeCwA5DnYnp1jrZYM040BB2JTuoSRH+01cT49SJBUMM2BqIOV5jPqPNUbb79Cfd3NCS9M8bhZ
 XpWqogLhD1SKb8wLPo2Z2RW1XOfoWxk4w48niuV0LFyR683aibetB/jQhGQPyITbwFT25swtWtJ
 LYhrJcmP0XWRLLyQKirk/0qH2O9tLH7Wlkhr4zFhFYH3GBDqdm+2Y5LP1M8IstNfRuUqjXh3935
 8IUDcqg5O13Un2mw4xIo+9aO/Xd+6MJ3S7cEbprrvC299O3j7q2fU3aaS7kMcERy64B4U1r3x6c
 8dE0yfOdwrw8PF9euUnjn5UJ9ncV0K/15qRN96Z8PqIvOv80roWrGGyV4kqPz0n1n11SqP0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=690 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300156

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add x1e80100 to the dp-controller bindings, fix the
displayport-controller reg bindings, and drop
assigned-clock-parents

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml       |  2 ++
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml  | 12 +++++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 246bbb509bea..46a50ca4a986 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e47333..791de8a277cb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;
@@ -191,8 +191,6 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
                   <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
-                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             operating-points-v2 = <&mdss_dp0_opp_table>;
 

-- 
2.49.0


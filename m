Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4039A22FF2B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917467; cv=none; b=USw4J8CVOD9XqVOzatbHO39QEnm/ud0qZh4Cs5TWDPx9juF5zMCYsve4mF/sU2oywcBdWMozbxW7FwAqla4YIqmBqqiIzs0+DqTl5uHtRAjV6VNvUJxVgHp+ctwRgJWEuuN+6m5PMMdmyyzHSpwFJG+/NA4zdC6oC3ekZNusU28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917467; c=relaxed/simple;
	bh=W6OEXgXNX8Gqe89LMCjSeM73v/HbqEgC8SQtD8y6JEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMhZXYiv0ltftLWNYat41Dq5vEaKaZPKYl6yhzRftl7c5N4tML/sw2YIcCYty5s4xNtFNmsSgE2cPO6BWA8xsqc0XOxeJxupSaH4jpqqejm6Y716ggNbgWVxhAYHrDKvdwTp/XWg+6G4kWdzVO0O/M0fMS8n675g6oINtRwSvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puIi8/YX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puIi8/YX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7ZfFB032698
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RgX9Aci2OKy/LHgxiHnopths
	wLGl49EW6vrJhQF5Sd4=; b=puIi8/YXySjnaRhqdPF6arFGXrN64CFKlgec9+hh
	yazluQo/TWc0lbpIj5odU7MUowdsNeEbFfK5csRrlO3C0EEFxId7eNo2CawsvJnZ
	PTIOa8jzHsTkAenPYyRBUnBPsa7pvvNLyvf7T6hWxZCFzVqh/eKEEgepS0VGDcna
	G8U2mZR0m3OYEZFrFk78u0L+N7rS1Jpb6elMICfZ1AdRzNVMlKr5tA9RT+E4VNtX
	Srz+XlZbxjppxFXyMzBSpx029AEjLf5t/3+r1XP/SXtTmp2gjk84m6fTsazCuRMt
	Y5npPMV2il3EgMdInXJaV/+Yz9ulQ52+xwmoyVDXNrZcEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c24wpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:37:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so1301667685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917464; x=1748522264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgX9Aci2OKy/LHgxiHnopthswLGl49EW6vrJhQF5Sd4=;
        b=tni1LZESFJKCoFtlAynmSlOKjvHb4cPLos2/FdGrhERmnpHNOOUsvSpMGQIIt2ZUJN
         cTNEzMYLNcyKDMlTLzVcLrFrntK/0zBXo/KuMw0+eumiSJ7J9i89sNwpHHF7OUXgYoi9
         HL8/CRtlqWVcDYbklbs6GatxZlI7gjR1i8ik81iflwt5LJmFmd9H4USXM3M+vEZQY/iX
         VZDab6zObyYpFNogoKfzoSQYzJst22v2EEEWQNd6nHBqeL7cD9LdOwT/XHHpV/u6zhIK
         As5puFkL/whUyQql85kqnJ5DJQ9APlNVhSmw4Oo1QmFCSfa7n12p7GYfzaqEJnNAiAHP
         taag==
X-Forwarded-Encrypted: i=1; AJvYcCWxhZAt3ExriZk1ARu6UBNkR/r8cB9qTZRVURJUnScWmQQXDM5jKG3KrVQGfI6PJXOf1E9mUZT8b4N5/MM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyejDtEhPxBxLwpEDxdNvYmVPvrCF1obL8rlMprB2UrIzxXIrQE
	TYR2d/HSIfLtwn2EWxn0u1FpVqQgxsFG8eDPmepACzAwZmuDxESKFOkDa1ztrJIKQAB28ykLZon
	wyk059Vys7wN1Jje3e02+JrasQSNrJh+QKGb7Ec6eIQilXC9/BqcwJGnItnUmORR/Dyk=
X-Gm-Gg: ASbGncv+MP0arojeLJrL2ubqc0P1hoILS0mYpaLDgN2uZbIskBs252TB+G2daOOPE2L
	Hj/6Zd2WY2DuOM0MVEIoJvyRKV/wwILoMnZ4je9Tv426Ypw83+WYbXWGqsifT2dvOts154whZUc
	jmPlY4RblJuuaEmQ3V1RJxm4cBNTt0/KFsFHKP4dFvoGcxVyrxTmlrbrY7HwZu1EoQZRJK76JK/
	J7X+dB3owAutdIjhDWIJbSkvAv5P0OrQoora6zsG4slfngTUWvlv3zTuWR7hNUGhUXpuk4ksN2R
	wZHAoKFnDFVY+rjwreRtNyIzRwAe7HHzMYypH32ucUo4HToLvsM0dN8cOFOa6WdVYgrYyLyzRaM
	=
X-Received: by 2002:a05:620a:4013:b0:7ca:f447:c676 with SMTP id af79cd13be357-7cd467a017dmr3460591985a.43.1747917463781;
        Thu, 22 May 2025 05:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuK9ZYaNS9i+Q5elNYnjF85wlG4E7W2PQcAkgZfLcHHNu2rPiTZal61BKORpuvgC6jlMqV/w==
X-Received: by 2002:a05:620a:4013:b0:7ca:f447:c676 with SMTP id af79cd13be357-7cd467a017dmr3460586985a.43.1747917463368;
        Thu, 22 May 2025 05:37:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702a289sm3392445e87.163.2025.05.22.05.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:37:42 -0700 (PDT)
Date: Thu, 22 May 2025 15:37:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <jp6lxxm3httbz7ygu7bj3xju4l7jnnhvbpaicb36ju4hyxpb2o@4lhl7xzif6qo>
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-7-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522050300.519244-7-aichao@kylinos.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNyBTYWx0ZWRfX7w+7C7ZT0jR7
 Bli4Ohhzv7SS77+Xl3eW9ogBXn5exw4Bwfivst8ulfrvOGwxcaADW6WuWQrBktNCnHQ6HcjIceE
 xmSYqgN8uUGDjOl/jsfiolqtP+B18qh/h83Wp/bgZsDSx4tmF3fR6DYNGcyOwIqpjOQ6+T2TE2A
 7n2h/9luMMEgmM816Kaoq56LJ6eA/KIcQ2RwjCZAO5WckBrldm/0/Ur3ANtZSkBQQLn+y2cGUIF
 W5fZw2/OzO6WjoQ2NA73s54lQ3Dpo8mYoFmivm72McZVGLJDca44K8kwOOWtcoU0JAl5jW80fYu
 D7tpQUK27yOz79j59FLjlmN76NRAbwoPFBpwFyYFt46hWsd0pqxvaW/m4VFdJuK0lFA+eojjZYr
 Zsv0P7i0oHgpzVJXBdyPFw0O+DGXaCmENQfSEzbNO7uTb988uwHrVhOq/5agkQsYSJRkCkdp
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f1a99 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=rlxKSa1xbkCyiMC8iTsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XxG_43SFrxGsKeI71vabLKRW_SV1_U1j
X-Proofpoint-GUID: XxG_43SFrxGsKeI71vabLKRW_SV1_U1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=911 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220127

On Thu, May 22, 2025 at 01:02:59PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.

There are no calls to of_node_put() in the commit. So the commit message
is incorrect / not-applicable.

> 
> Thus, use this helper to simplify the code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da36d..62f49fe46273 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1046,7 +1046,6 @@ static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>  static void of_lpass_cpu_parse_dai_data(struct device *dev,
>  					struct lpass_data *data)
>  {
> -	struct device_node *node;
>  	int ret, i, id;
>  
>  	/* Allow all channels by default for backwards compatibility */
> @@ -1056,7 +1055,7 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>  		data->mi2s_capture_sd_mode[id] = LPAIF_I2SCTL_MODE_8CH;
>  	}
>  
> -	for_each_child_of_node(dev->of_node, node) {
> +	for_each_child_of_node_scoped(dev->of_node, node) {
>  		ret = of_property_read_u32(node, "reg", &id);
>  		if (ret || id < 0) {
>  			dev_err(dev, "valid dai id not found: %d\n", ret);
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index 7d9628cda875..64735f2adf8f 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -962,10 +962,9 @@ static const struct snd_soc_component_driver q6afe_dai_component = {
>  static void of_q6afe_parse_dai_data(struct device *dev,
>  				    struct q6afe_dai_data *data)
>  {
> -	struct device_node *node;
>  	int ret;
>  
> -	for_each_child_of_node(dev->of_node, node) {
> +	for_each_child_of_node_scoped(dev->of_node, node) {
>  		unsigned int lines[Q6AFE_MAX_MI2S_LINES];
>  		struct q6afe_dai_priv_data *priv;
>  		int id, i, num_lines;
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index a400c9a31fea..d7680dd3a3bb 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -1236,10 +1236,8 @@ static int of_q6asm_parse_dai_data(struct device *dev,
>  {
>  	struct snd_soc_dai_driver *dai_drv;
>  	struct snd_soc_pcm_stream empty_stream;
> -	struct device_node *node;
>  	int ret, id, dir, idx = 0;
>  
> -
>  	pdata->num_dais = of_get_child_count(dev->of_node);
>  	if (!pdata->num_dais) {
>  		dev_err(dev, "No dais found in DT\n");
> @@ -1253,7 +1251,7 @@ static int of_q6asm_parse_dai_data(struct device *dev,
>  
>  	memset(&empty_stream, 0, sizeof(empty_stream));
>  
> -	for_each_child_of_node(dev->of_node, node) {
> +	for_each_child_of_node_scoped(dev->of_node, node) {
>  		ret = of_property_read_u32(node, "reg", &id);
>  		if (ret || id >= MAX_SESSIONS || id < 0) {
>  			dev_err(dev, "valid dai id not found:%d\n", ret);
> -- 
> 2.47.1
> 

-- 
With best wishes
Dmitry

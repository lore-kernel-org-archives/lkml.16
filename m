Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B4C28BAA4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165120; cv=none; b=BiGUGJEBUOtO4JE74jaSm5K3MRHkP4aUox7E+v/+C1l0Ew41sN1PabHbNqOmXqNTAktPxoszMfRJgLbpXZPZja5HzSgRVenA3cgRo/+qOKeaxrPionI9cPuX3biLYkYjXROrDHOjkCgO2AtGW+YjYzK9VL2NW2YdSpffRPjYaYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165120; c=relaxed/simple;
	bh=zINNnQKrwggK7kWTXCiCVdUpJ8Oalqzc3qWmQt5O+DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8SwNium86l+prRqIN39PFJwyymOkAFnNiTMDoCFbnYpEN4X0QqlXBl4G9IemmYQOS+EUOxECR27C3l+VpG8LwylYOk4zuYnelWUxScDoNpjUcPxEBgh5ynEptx91IyB+rikogXbBrIk0/fVNMxBYCBwM4+dnBJDXWImS3UdURA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mA7A/Uqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mA7A/Uqw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H85U2r027542
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W0uz0+KKGBlzrS1/FOzkECp+
	49kWHHy2vJO6qOrGQG4=; b=mA7A/Uqw4WisaxNnnnuxlqWRNKsSoRapAFqB8vGU
	vgJLF1nMZAMHkBfy9zkKfY1nUjyaQbJLHNKcOpvj3i5Qj1+ZKKdzbCULfbRaO03E
	fyfNNSUymV21WP4hihwrIaDv4kfS0i3hM2z5Uzrvfxc6nfMoGRzkmlnjToUZJQXX
	uY090Pnnb/5YCT59cZrh1EGNID5Agzsl5IDKt6wLgGvoe2pijPyvYar6w+q3bXbv
	4hQrZvfNdjhJEXSs3/lgSKihvL95Ef8L88BetF9GymZ4JNEgHY1xEOpm21ThObcC
	DLfuw6dOF48u/BUqxVZMq7DGgkBAG6/pDJDZin+S9mujow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd0dej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:58:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb3466271fso101017996d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165117; x=1750769917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0uz0+KKGBlzrS1/FOzkECp+49kWHHy2vJO6qOrGQG4=;
        b=Tlmi34VQ1oMGVAPzxiqJKArONiwvQO5oWUn4dq1Z2lJYa2NI5Yk849ULVZJN8iQAkA
         9b2Qe7CAy2vMQWxO1HJdF0e+Y91Jm/5B9/9UZq0Xt9IugP+Z8TpP6R7WLqK8DcSGwTIM
         JPIUQ1ccVzjzUw5IZwszO98HNo+uwyr/e+xxuYGMPCpctQ2ZIDRMlbkSDf+xXeBd/T/b
         3+qF/mh802PzbEFR/4rZjJAN0LXBklmr6o03cNNJ5wB577BtEyRRDTsnLNMtmRIqUZzl
         c1QHlcKHZ4D+DZJwzqSkNs1dDp8Gvat48aXEEtesWnD2UPxng5zv11As8n0wh9Zwxv3i
         egZw==
X-Forwarded-Encrypted: i=1; AJvYcCUWng7MqB6mP8yeFgfI3DmMvarv8I28rGUjctOZ+E/iRdYAEYslQHxjKEi6iZygKqe9Ch6qL3VRUxBd340=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfxv9rj5QqFM22QzUiskwxbfZG+v3QSMjzn6wA7xpdbcahoWgc
	YIgaGW9y/KhF7UFL5y49zEKhXzqs5wxYBnCSsYmjKqnmU8PVaVAfjyu1MJAiLbvhEbjx8zX1UWa
	06ZCUM2kH7OUuzbdsHoO6qLk6GMeOKprK+9nGCBv7Ck2yJ5E1SFuEZ+3wF33nC4KH5aE=
X-Gm-Gg: ASbGncsNVQjBwiFKLx6eflnFz5FUIxqSADXkRJOyAv8B93f6egrP455ZWh8KGhgUqwg
	5fG0LBjDZI2wkGN9dD6FJiM3euXeZXJuP/rNJM23rhxK9qb5I0dDKuyCPLn4prwWUcRb83mAG/T
	YCsqRBp3aLfW36Npj8BriobPYHQlXR8U8YWWlR2AhNcFHI5IZr27BbR5elOoG7arm7RV0kplsfJ
	x1ka2g5vXTOcqhRVL+6uT5fkmoQ7ALo6W0N1pIdTz4toAYyFOxrQUS074Oozelboyk3hDZ2RTTi
	jO73Z88fp35Pk/HqO4J2+16oq5bweXb8cL0S8uFFibIgcJ2PmLBG0OiqNKHdyICOe+dYb7gFI7K
	sZRg9lnS8ecT5HL5dKIvqZi13lxwAyAKv78Q=
X-Received: by 2002:a05:6214:4f02:b0:6fa:9ca0:c67e with SMTP id 6a1803df08f44-6fb5e9d88d4mr41808206d6.5.1750165117293;
        Tue, 17 Jun 2025 05:58:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8gTs0Edzt9aosP4y7il4/VWAuaPvutV9CGNOzsElFxCXx34m2lMMz6XPGkFJaXuirGYya/Q==
X-Received: by 2002:a05:6214:4f02:b0:6fa:9ca0:c67e with SMTP id 6a1803df08f44-6fb5e9d88d4mr41807766d6.5.1750165116761;
        Tue, 17 Jun 2025 05:58:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ca1a79aasm278537e87.152.2025.06.17.05.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:58:35 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:58:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
Message-ID: <si3yx2f3isyxxqzlrrvwqcbnogqy42fiiipvrnyd326gpds5cd@chuo7ggmp6zq>
References: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>
 <20250612-qcs615-mm-cpu-dt-v3-v3-2-721d5db70342@quicinc.com>
 <ezlboeao2mqdbyxw6orzcqla3xthbo5ppuuhugwyxs5t4njvsd@qyy5r2ksmrj2>
 <89536376-6619-49a5-a267-b5a6b98940d8@oss.qualcomm.com>
 <8bceae03-33fe-4ec0-b1da-785af793dd86@quicinc.com>
 <928b8f33-b3bb-4831-b71c-756971ff7cca@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <928b8f33-b3bb-4831-b71c-756971ff7cca@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwMyBTYWx0ZWRfX3ahfTeTMTzrJ
 ROXAdwZfsSvDP7zcgJEmU2UnIVx+W1WRj+1owURep67jo0Es43z3Dki1RKo8ysBwgtk8glc7bMH
 goRbN/nifR9zMSbHclG7QWEorGPJDsIp8rXdjgTYbEIq2lLIcZuuKULrwS/ktBrtn/iq1mKPvTW
 dZHJqFiOg5GEl4ddIzuc9MMRCbdeJJpVxPrdclfFvzrxjqZJId/ZyF7zvb0Ud4oARTXgSE5u5Z6
 AJ/xk9P5qYZAHnXG7Q5u1VuxLYlK+iw0Sn/BnDHDTmGWvTC3aYzJGzU+YZrsF/VgFR+b0Zrb/lt
 xuKMbcAjNidplVfXwsW+onOMtnVU49zx0PwiIaKsAca0TkjgA7n34QHnrLQJY+khMYdH/iTh2Ih
 ivt9C9O3FK/O6VmQeO+7nH+Am1gT5Ywry6cYq4T9bAAISC+4eKMnyeo1U2KoB0ZReMDneAsG
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6851667e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=t7vRyMQEQ6ESp0mngWgA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 30hBlWo7MHc571jvhaJFh0mFbtghb_tT
X-Proofpoint-GUID: 30hBlWo7MHc571jvhaJFh0mFbtghb_tT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170103

On Tue, Jun 17, 2025 at 02:09:32PM +0530, Taniya Das wrote:
> 
> 
> On 6/17/2025 12:59 PM, Imran Shaik wrote:
> > 
> > 
> > On 6/17/2025 12:27 PM, Taniya Das wrote:
> >>
> >>
> >> On 6/13/2025 6:40 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jun 12, 2025 at 03:47:21PM +0530, Taniya Das wrote:
> >>>> Add cpufreq-hw node to support CPU frequency scaling.
> >>>>
> >>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
> >>>>  1 file changed, 29 insertions(+)
> >>>>
> >>>> +
> >>>> +		cpufreq_hw: cpufreq@18323000 {
> >>>> +			compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";
> >>>
> >>> This wasn't build-tested (or was edited after being compile-tested).
> >>
> >> This is already tested on the QCS615.
> >>>
> > 
> > Seems there is a syntax issue, could you please check?
> >  
> > - compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";
> > + compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";
> 
> Yeah, it was edited. Thanks, will fix it in the next patch.

Please don't hand-edit the patches before sending.


-- 
With best wishes
Dmitry

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51040748F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820241; cv=none; b=Rujxz39XvbY+VzannqwDg1HfW7uvwAVhkGqjeRdpsYt8Eu690zkgLo9cYG9+1dPfoSme/Je+hQYDCE7EXaSiiVQxDSP06PokkQnuU4Wa6D8UrTK5LpipgU6/ZI+2IVg3M18icw6fI+O0VzJKnG4O1gYT/kX5LdZsOPoNwESPX8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820241; c=relaxed/simple;
	bh=0ZB4tBA7VPI4q2+c0Iur9EkWxAnjfflthKsJ5EfCyNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBzLjjmgg+aDHTkjR8s94/jNtkBfb+F1w7+Q1Be52Gp4Ocq+Yf5nPJEKhPxTaMxoIVwtZ6gCi9B0K7XinzFpGxI2IOgWhm7uQ0i/EjjbQVWoezhFZ0jjtpkCATUOVNB6lD402Ze0bfXbasUXK1ohH/BkugmL2pm6msClOj73snk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZtOAtCT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZtOAtCT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D0fmwT018527
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=311F7krfIodtR5drIHKaH5kh
	X/9H/NonlAsY598nqSA=; b=FZtOAtCTdEghKcZAGH7tmzlOnJ+QW+EJbZ4a2iKl
	t2KhWrnRDLdrAlHY+QHXOtOtX4jVsrkiFWyVL4gHnyKM2U9KS2gqBy7FvzdjhKHv
	06+rwmBVGmq2HlCv7L3e5fKh9qD63JTFc1yZfs7OSJKRGwZlTzQa4VPtJreLCFRl
	9gBq8lp1iLl104flOuAILllRUNq3+X13vYOyZSEBpkL3urbsUYC+QZVD6XAR5bg+
	zBB6l4F4rkGn/r0YjjQ1aeLxBWC5yl/uIjV2PsFkZ97XJG+iin9fWXCmtYO17FTu
	XQiBIlEK20iNZt3BZePZvcdxqC5FjY91ePv2xUNboDy1zA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477y3gu0wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:10:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d38c5c3130so385620085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749820238; x=1750425038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=311F7krfIodtR5drIHKaH5khX/9H/NonlAsY598nqSA=;
        b=t2iLO+rsqWYq7K+eos3zgKeND0ZRzUvo6mJFN3xxWblI5QAUAh8PPZII606LGqCB0T
         I1kwxVO8jyBRVR9Y1OUrHvzvL6SYfAjf9WfI5YroFR3trfocGsMPKYJ+daE0UR7gOHV4
         Scv+5GUZC3HReVddSYJsrIDEwK+v0SJhMZQoX3j8mPCKR6b6mPhJQCng7Rvtqw82YeEC
         uMyIslt8B3N3/ffnxj0JVhpvKsK1d8fBAHUnovmXkwxk/lhpAcO5OMNxjPvFIyWCaQBU
         jWbiOohkMrbt9KrGn03NZDPuFP3fck3doql02Azjgrzie2UPD5GWp2vFo3+RVaZSx8xg
         HSKw==
X-Forwarded-Encrypted: i=1; AJvYcCUeSBIFPMRNze0Llkkh/usQhV0Gjel4UDwJiA2NxONeQatiQqVUAMs9HcwbfNsnpyjS/DRf/6yNKFP6FuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZiTZ3xwAVVlO29u4ScRxwK6nm7w6PtfqfqxEjImUXc73ZFUcK
	sQbXGYL10o/T1cfujVk62kKRSFpWtLxdB3aci1Hnbxoi6bbnpUefMnFUqffKGIwKMqv5VterHET
	moqy0K0dOxPdEXF2rg5xUq4q/Im9iip+9VsgFS1fzUi/kfkfKcPmiG/yqb6VZLc8KQHY=
X-Gm-Gg: ASbGncuVvxM58C8diUHBs2Bm4AGZma1Ccsugg2bt++i/QV93hCzl+onz9QbempswXbX
	gYXY55346K5UlGzYQU7xTLFA3Ak0lNaTRWEjEURCJtAMX1eXHBDwsLqjBsBISpZvWbBLmaLyhSn
	kMwcZGcgkLWQ+Co9fFGgefDTum6Ab06Z/XYq+FK3g32Tak9oIpR35w0b+GxzXvGOkDcny28DhnS
	/KnXxGYeHtyCORZkQXreEwvCNJsQGxkXzsZhRaBBELCFCXSQXfCQGz+zxD/MqqDXD9SHVrIZJ8F
	sy+icw3UbXHS2WO9YtSOZvgfB3zF2I7p8NTu8xJuX6itROFLmFndbxYL7G2QfVeGoBwd3IdHVGa
	pcQUiCUj9yvJY4V5boY4GM4ycn8rSyjz2b4w=
X-Received: by 2002:a05:620a:24d2:b0:7d2:271d:d395 with SMTP id af79cd13be357-7d3bc4b5acamr527514585a.37.1749820238091;
        Fri, 13 Jun 2025 06:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7prG3XcpQX6Swj4+2/RLuYYqGBZcoo3RwqH7z0osM9u+iPSEeNwNKJ7Z5Tg9Glvb5yCkC8Q==
X-Received: by 2002:a05:620a:24d2:b0:7d2:271d:d395 with SMTP id af79cd13be357-7d3bc4b5acamr527502985a.37.1749820236999;
        Fri, 13 Jun 2025 06:10:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b33069a9asm5648641fa.27.2025.06.13.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:10:35 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:10:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
Message-ID: <ezlboeao2mqdbyxw6orzcqla3xthbo5ppuuhugwyxs5t4njvsd@qyy5r2ksmrj2>
References: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>
 <20250612-qcs615-mm-cpu-dt-v3-v3-2-721d5db70342@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-qcs615-mm-cpu-dt-v3-v3-2-721d5db70342@quicinc.com>
X-Proofpoint-GUID: 1tH4n7qqUGH907khkKUZ820NkueJ_hEw
X-Proofpoint-ORIG-GUID: 1tH4n7qqUGH907khkKUZ820NkueJ_hEw
X-Authority-Analysis: v=2.4 cv=DPqP4zNb c=1 sm=1 tr=0 ts=684c234f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=A1pg4z-Cax2pQkPbWCoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA5NiBTYWx0ZWRfX7iOudW7m8GlY
 Tps8tw8XxQuAUAxqT7amQunARKhA0jsLIb0o5PUmG4a+hZrDx2UZj0sFEaUBd4POpjCJrZ9J3+4
 SiMNQpYylUF12t0mMBQ9Is6WMtoq/2anHSp3JWsGrpzP3ArYmJD+KLkyvX2gswemcFs5VYkHW7Y
 0tIWYFc3+u8OmeSN1VaLE48VFjiR/VxsChW4Z8lW5L4agkWh0imZeb2IUOO0yXiNjYBDQ439xic
 Bf5OmiiWOS6OECSAHgpzxz8ANEbC7J6S6zx+AJCy2YX7zGK2n5DKIoG6d0/3PVGxHt9wprn+c14
 BAt/S64uW0TQ1kwNBQxAYdToQcfaJKHAJDR8Ji1NyLVTV68zIpIzVyQFcqiZIm8cB04DwzzjesQ
 DX4E6/rNFZH0dDi5sHncO28GyBwMzxhEna0HXB5svVvuWIlHi4cnS/GsSiZKcU5oLmk5I0zf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=988 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130096

On Thu, Jun 12, 2025 at 03:47:21PM +0530, Taniya Das wrote:
> Add cpufreq-hw node to support CPU frequency scaling.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> +
> +		cpufreq_hw: cpufreq@18323000 {
> +			compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";

This wasn't build-tested (or was edited after being compile-tested).

> +			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
> +			reg-names = "freq-domain0", "freq-domain1";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> +			clock-names = "xo", "alternate";
> +
> +			#freq-domain-cells = <1>;
> +			#clock-cells = <1>;
> +		};
> +
>  	};
>  
>  	arch_timer: timer {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D342111
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749515136; cv=none; b=reBS499U9cisVkJNQpcr8ZU/DJ8T9Ybexdw523+ckKuG6csUvJSmKgp+eyxgwfhhMpvNyr33f0C1zh3gKnZHni2RA4zkE6dz9goyPqpAhW6wPl+LFDFbj4Mz2lp1leMP0eTo4P5dk9tavW2lTQhM+K7LDfa5t5CXqC/FjPe+HzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749515136; c=relaxed/simple;
	bh=aWBGDsONt3DsLjvWK84WyJYg7SV4UPTZ1BXTjC/JrWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gt0dJw9XWpg8QesBQnm/6UsUEvoU3rKbjeQmEPNdhNIYwzJWeBFnDplb5P5gwuGROJGo1JlCxxk2oe+IGSUABhGB0aLp4KmCzLIVzksipHFwuei8ndZS8J5hOTn95ntHmDrJ067axy4oMOzv4TvRF1sIzKb+mQfpfTv0/LOd91w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpDb1dMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpDb1dMD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559KOsGR017676
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09vmSKArL95chil96Dhr62OqEuJwsqeryT0wyUra1sM=; b=kpDb1dMDg3Hno0DS
	5gjYFOI1O2StNBnOWfSDaGMePQRiS3m6oxqJchOnrsGgCmR3jrcxZT0Rp768bSWB
	+EwwGJnicIFX74T6DuMlcmc7gk3mHgmDg1bXKGwG/r694Gay3DFd1b0xe2nAM+zO
	918Jf5YQ9qvAth+frXwH2PuTa3/jJlBufDFaMDn6bkguoWaCl0K1qSbe+49QJ2rU
	tdCN0s6As6lYVVdb764/Y2CBcS/iQZsGvpkpRtZlMgRUfuZrUuu5fm8mz8I8Gkzd
	4DPlIMw1cDSE6pgOPmzoIFapQ5YnjFs3XaFZO1Pr2bEMNhboqKLftsZoLj5gyJPF
	8XIR4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcgd42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:25:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d094e04aa4so94293185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 17:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749515132; x=1750119932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09vmSKArL95chil96Dhr62OqEuJwsqeryT0wyUra1sM=;
        b=ar1X5z8x+y6cI+wKqXlkimuCamWxEHxYzRKJVByTutjqEXHbZ7Iz8D6O5GajfEIhJo
         g1e+ERXEuL2NheF9sl2LVHE6ragJ3pOPFVwVlvwitlPC8dgINvmD+6lu1W+XfWyon8sa
         vxsmnKao5f3SvecvdmldocG9ai4l1cSkCPwaWLQXV+po2TXnCvSSOJAGNsAddGJQCngz
         F5bQtJm/9fMjbOJMw2IYWQs5SGfyGG7YQkfbI9sGK+bEit3sOb+zP5wa6sFHIrwhCbRx
         Llgp6KP1emaG8ez7VeEc8ubKXFRSsOt5e3Nr3qwZ8dXh3gfdckKUA3PW1JD6FyvejavA
         0F9g==
X-Forwarded-Encrypted: i=1; AJvYcCX7IJkFfqHfx5FAB7CAsYbJ7dQykLUNATARMjcWhG2CDtm4ksYK4XUUrpsE8oX7xglkn4xAQB8r2/+OPfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKgp/n3Z770d0wGVTGX3nHq0gvrkO5fpYfGzUqaokOOo6dm+6J
	hzDwtzk6sdF7M+olt4Jrg8GXuCOb7y2/nxc/bQr/cyJ9llxYgpFK9E0J5/UieC/YM07OASX1e0V
	bRUgIDLE/huVQ4H51pvjNkzcLwzpHaaMerpZwBWXh1RsLXfbXRth9OJqxiZTjChoKSig=
X-Gm-Gg: ASbGncsBn3FX3eGeHDSmEjpkpUuRKLkyrYKzmWoQohq14m0fpfOta3/VnkrFXI37ebN
	ZLA47sSlt8k+UaoCit3wCImkAHX6OsmPUov5BELl8rlreTAk9/Eyu2MPfP/QPqnNYGC4fQYr96Q
	9uaCpIzVAh5OS2z/vDX366GOwIrnEZlX6A6H+zptOMSJBWLfJod9JO9nz3AHOAlk7hbEVCYRbir
	na8PHESL/dgopOdwWeqWJ207tP4wofYmCmc4bVSR6rYKYKAO8s5Rrx1sFKOAS1jq9wZ2HRMoZRY
	TsRMmcynOOH3ugkThicTv/2zqmqTZiANVXoXac6OBntHQFaHCnOvZUa1onlcYZOyuqqF5ckKUA5
	c
X-Received: by 2002:ac8:59cf:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a669071b67mr92670541cf.8.1749515132091;
        Mon, 09 Jun 2025 17:25:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfBazml5ir8PMKKBZnsIy6xGkN7uScP9aQfNz9MkoMEsDOeZMCUgKUdSP77uFtWQjRzg3uTA==
X-Received: by 2002:ac8:59cf:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a669071b67mr92670401cf.8.1749515131704;
        Mon, 09 Jun 2025 17:25:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60778377686sm5444185a12.25.2025.06.09.17.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 17:25:30 -0700 (PDT)
Message-ID: <e1367b38-875f-4a9f-9dab-9aa9f12488af@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 02:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: enable sensors
 DSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250608-c630-slpi-v1-1-72210249e37e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250608-c630-slpi-v1-1-72210249e37e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=68477b7c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=UYkWuftlsXAw6W1qggYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 2Y_D1CbwCP2t5OdXezo2Yl6fDGdM0fWJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAwMSBTYWx0ZWRfXyg5WFm50C/ia
 ecr17DuVqHi+VxWacKxjZ2Q8YMV1e+X2+OjThzDKcK0e3+sg8Av4bC9x3tzvTnRH47Me9wr16gd
 ZgW9460ORadBu7H3KDDWIg4VUOqcT7zKp9uWLYpjrZHJnBLk4zG5FGRnQ9Y2YIqKiNC/aCqOlJq
 706A9sk0Sx0u7HFLBk8wnyM2+pTXKZXzxP4ZvQf+59hyMdmTnKHn+tLwb4N/au8o50znFAYB6QJ
 WAGhG5wnEmNEGAGp9rGn+g9UClMMYagkYhJB1am1NonVRyWEPZNQn988p1IAt4QGhZcjWU9DXuD
 gQCMrlRLk5/+BzeRAfSevx1akrCa8BFVQSe3dgzhxEdxx8KMD1O6GEypeZVMFbTo9Dp8UtgcrFD
 RguQuepKILSDFrMqy7w6QAN+PBK2Td1db9sK9tVwtzHZudAka8L7hDKuOJjn7aKQa7SYBQyu
X-Proofpoint-GUID: 2Y_D1CbwCP2t5OdXezo2Yl6fDGdM0fWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_10,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=599 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100001

On 6/8/25 6:02 PM, Dmitry Baryshkov wrote:
> Enable SLPI, Sensors DSP on the Lenovo Yoga C630. The DSP boots the
> firmware and provides QMI services, however it is of limited
> functionality due to the missing fastrpc_shell_1 binary.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Check if the Flex 5G's signing key is different (or maybe Lenovo
had more sdm850 models?)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

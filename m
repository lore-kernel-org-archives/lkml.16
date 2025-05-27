Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB91724DCF1
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335776; cv=none; b=goOVjy7OGUq/kyR7nzfF+TKxku9nA9hJyK0ZzT+R2ZufoC9XsqpJIBhBFImBe0ueYCkdRtrJuqzY2+VFqdtjmduOSn7yA1ch9P1bIPWUo1przsYaSqzIPdC0lW0W7I5jIs0yeYfp5dQhwqMf4TiqXU8Y0HLOhX40+T1B8T5WVoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335776; c=relaxed/simple;
	bh=4XcFGrJC9iGiUpCg2jKwl2TCmvPtu4xDXwaqMgFqX5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9pdSEQ1e2M+s6UCBtsycdeoqTAP9VbdfO3WU+mFxc5w8dSz/QlVtxvXKOU6Wch4yBCc1CnmLRaE9oo1hzzDCedvvRKNolP0FOmoK7/Zdsh/SmQkLgGFnYzeXtluRVIQdbzbwBB0HiE8RFBNYIcnNHPspzlk2ug5XdlpJIeta5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=j43NJoZl; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="j43NJoZl"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R2t4xW014422;
	Tue, 27 May 2025 08:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=Mt6wD5bb3fwJSV5WjDicc
	VTFl6JrI1jZaNM5kWt1LMI=; b=j43NJoZlG1ccqMerKitVWgBKbkzGYgJXl53/D
	txiIJ4atU/CAZqLAuYwkB/2wMwJNGDrQ26mmzDjUL7inBmWFdTQehYk1MEIMGaxJ
	MX5M1GNZPvu0SPSZTyn39v28RQgLHW7P1rU8V/ZUUkBZXBuoumjsjh5pmaH9mKPe
	BKCZWQTcaDORFhStbCE7gXCzJq38elWNdEI3pki/gExpC6JVTRp0v8YP2i0ihT8U
	HqNOhTGWLGntfUbpl7Ok5XYwSfQObF0CLiZLaC4o6OX70hdRI2N7y6aWTmKygNbm
	1yfQGrfXqHbUl98mQEdLkjHSJAvhtKUiLDsu6HUOXri3vTaNQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u3hrwmmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 08:49:17 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54R8DxIN006819;
	Tue, 27 May 2025 08:49:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46utnmhp7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 08:49:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54R8nEYa34013724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 08:49:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1DDF2004B;
	Tue, 27 May 2025 08:49:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D113220040;
	Tue, 27 May 2025 08:49:13 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 27 May 2025 08:49:13 +0000 (GMT)
Date: Tue, 27 May 2025 14:19:13 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: WARNING: CPU: 12 PID: 44394 at arch/powerpc/kernel/process.c:437
 giveup_all+0x90/0x1d0 (v6.14.8, Talos II)
Message-ID: <aDV8iWe2nWX9JuvV@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20250526205537.2f1bccec@yea>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250526205537.2f1bccec@yea>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=AOOMbaiN c=1 sm=1 tr=0 ts=68357c8d cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=8nJEP1OIZ-IA:10 a=dt9VzEwgFbYA:10 a=b3CbU_ItAAAA:8 a=7X5p3jM3IfCmLyZplJwA:9 a=wPNLvfGTeEIA:10
 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-ORIG-GUID: RoPCBLDIRK_VMXAVTQDIZyE35F1ZL3rI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA2OSBTYWx0ZWRfX/pAem8xUqSIv qSzeUoC44nBuoZFYBbxhO+ekM0e6duQK3v0PVzWu1Iasztu9QhMJhmQR2HhVeIL3lP2j0NZYT3n qig2pNwntsJcdLofNh1VxIk++q88PwaaTFUptSPo2cA74kv37DCtXy+AQU0gzkCYfCfE7Dnr1SU
 1wVmYxFtOa3eI17BVnZiYv00fp8hjwraN7hTdAw3b8dPmwMircVxoGBWPwu6lGrakrHi0x6cdfk L3XqqIFBSXhGIoofDu6Pj7IzSKn5ffkfsLM8M2Rky+3QF0AIwT5xZ+b23ZwWXidY3BsEoNFlGuo w8dfS6ckhAStkISKZF7loj28bzgXsbNJS+LDrLo5lEIR3MC4e/DvHxMA37sYKWxAKhBqLaWgbCx
 xqC6R9bQRS8yuHN1FiE9GBv4QFb2FMR9Rkc+kaR9CkI/IMPqN/vvSO3rdzYppjUUFA5hQ3CF
X-Proofpoint-GUID: RoPCBLDIRK_VMXAVTQDIZyE35F1ZL3rI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_04,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270069

* Erhard Furtner <erhard_f@mailbox.org> [2025-05-26 20:55:37]:

Hi Erhard,

Thanks for reporting.

> Getting these from time to time when I run the machine for longer periods building:
> 
> [...]
> ------------[ cut here ]------------
> WARNING: CPU: 12 PID: 44394 at arch/powerpc/kernel/process.c:437 giveup_all+0x90/0x1d0

Its a warning with says that the task's userspace MSR register has
VSX set but not the VEC or FP.

Were you building the kernel or were you building something else.
Can you paste the command you attempted?

> Modules linked in: md5 md5_ppc sha512_generic cmac cifs cifs_arc4 dns_resolver nls_ucs2_utils cifs_md4 zram af_packet cfg80211 rfkill evdev input_leds hid_generic usbhid hid radeon ctr xts cbc aes_generic libaes ofpart vmx_crypto powernv_flash gf128mul drm_suballoc_helper xhci_pci i2c_algo_bit mtd backlight drm_ttm_helper ttm drm_exec xhci_hcd ibmpowernv drm_display_helper opal_prd hwmon at24 regmap_i2c usbcore usb_common
> CPU: 12 UID: 250 PID: 44394 Comm: sh Tainted: G                T  6.14.8-gentoo-P9 #1
> Tainted: [T]=RANDSTRUCT
> Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
> NIP:  c0000000000181c0 LR: c00000000001819c CTR: c00000000018fe50
> REGS: c00000008f603500 TRAP: 0700   Tainted: G                T   (6.14.8-gentoo-P9)
> MSR:  9000000002823032 <SF,HV,VEC,VSX,FP,ME,IR,DR,RI>  CR: 84042822  XER: 20040000
> CFAR: c000000000018110 IRQMASK: 3 
> GPR00: c000000000019fd0 c00000008f6037a0 c00000000115b100 9000000002803032 
> GPR04: c00000000bec0080 0000000000000000 c00000000213dec8 0000000004000000 
> GPR08: 0000000000002000 0000000000000001 0000000002002000 0000000000002000 
> GPR12: c00000000018ca30 c0000007ffff6800 0000000000000000 c00000003bd322c0 
> GPR16: 0000000000000003 00000000fff9cb3c 0000000001b42e30 0000000000000000 
> GPR20: 000000000072b0f0 0000000000000000 c000000002117c00 00000000007401c0 
> GPR24: c00000003bd32800 c00000000bec0e00 00000007fcabb000 c0000000020fd8b8 
> GPR28: c0000000010b0218 c00000003bd31a80 100000000080f032 c00000003bd31a80 
> NIP [c0000000000181c0] giveup_all+0x90/0x1d0
> LR [c00000000001819c] giveup_all+0x6c/0x1d0

If this is happening with only the recent kernel and working with a previous
kernel, do you happen to know the previous kernel version.
In which case, is there a possibility of doing a git bisect?

-- 
Thanks and Regards
Srikar Dronamraju

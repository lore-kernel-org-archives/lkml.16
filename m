Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D3E276048
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224096; cv=none; b=FeVCCzPONj8F6aHdEniyhbpZtVhnr6ZG+gCH94FL3V3E0V4ot08xnHKiSOXmvhQhVmgsqHNpJj7OQ3QUNb4uDPyyUoukcBwH0yp3iuSppFZdS5MDS28NxQb60knLPhYFJnf13ps6ArBnfHwsVB94JOu8hTHk7j9/+lxR+NJYlrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224096; c=relaxed/simple;
	bh=BS+zh5yU5vGnBCSvvOVWB1cP4WpPeREEPt0Phq3KVZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TyEKDhAl1WrXBbLHZ2BxAYz/CAqlxbSkHvM8zvv4zDNA6604PHSLw6KGH2meLWZx4208e/oQyDfkh/uSzn6yX4znB/Rq+ztE+IbC8VLyXfwVTCm4aI8Dod4GqmuTlu/ACeO0gIi88dCpYI5Vvhd9WOQUEx5OjIxho7NJqAtEu6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bcQ1GQN+; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bcQ1GQN+"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MZgm027935;
	Fri, 6 Jun 2025 15:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=tnj6bwPSnk6wSfeuheEGEqqUvWoPr
	0IPs+/pGnVSKXE=; b=bcQ1GQN+wbAQh2+B9K27P+3y2K5j5jC7ZLYOEH0q+KHMN
	TeCeu799CpB/+IpOdcC63nKaYZlRiA4BqDlvtFFkYtoBt5n8WCpVHEnADjvTAN7Y
	arryUehiiEELa//M2S93cl9v1ho+tMFizyI7pkUEMn8YIh+7Ig1ybQwT3lBbn8N6
	zwZng6cXSkLJO5QnIW3Setk3qg5TkRYgmAT0tcxT5Hy8N4pWHrzxU1puipszq09s
	QdlaP7zguTAZ7mbDcJrPUicV9rz4kfAkGPlFVRL7dZqbOCXi1VujmzHXVxU4ALfv
	H1PcdNifJJyKhxZ6/BCQFV2/pABln2L+CRfKXKGJQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8gg48v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556ERKdn039260;
	Fri, 6 Jun 2025 15:34:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7des2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:43 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3d015517;
	Fri, 6 Jun 2025 15:34:43 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-1;
	Fri, 06 Jun 2025 15:34:43 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 00/13] objtool: Function validation tracing
Date: Fri,  6 Jun 2025 17:34:27 +0200
Message-ID: <20250606153440.865808-1-alexandre.chartre@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060136
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX2oDtO9oA++4h csEmVQgf7VkVe1fix7+//8uBVZllCOJY152NACiIVwCoiJZWDqFDyQmkHiCGrzyI8r6YmK5qhrC GemAtH2m3qHfsPJl/7LnXhOaGXfRZamQ0C+UQzPPeQe05emFUKMYJ8Jr5CXBzA3CMAeNb8LE4FX
 Cz02oNQbINHOf8lJxl+aVCYA6ZAm6t0+LJ7W6+F+N46sKnsNC1f67x37w4t/H4U4LDcnuT3NJ0G Es0qo6o0H51ABLhlFLds5nCAJ3RGWouxyuLzNtOTBauuzt+dWMEkQxguvjKpiIsufqsEO3EHYCm ChNANeZquRNRVWIYpJJd9axWmfezYEO8C7Dr5I1bgqZNbef/I2+ngTEkeuax5BrpyFH+bKlz+TM
 6ja22cNmmJ3qR/oOIDQbRJmMQIFAu7lkq/sqSHkFWrDsqs+gCsd0mEL4NH1aUkLLDEuPnqTS
X-Proofpoint-GUID: TypE75PePfKSf2DDFOBieyQOlHnFJF5q
X-Proofpoint-ORIG-GUID: TypE75PePfKSf2DDFOBieyQOlHnFJF5q
X-Authority-Analysis: v=2.4 cv=H5Tbw/Yi c=1 sm=1 tr=0 ts=68430a95 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=nI6GfosoK6DoNDHVT7AA:9

Hi,

This RFC provides two changes to objtool.

- Disassemble code with libopcodes instead of running objdump

  objtool executes the objdump command to disassemble code. In particular,
  if objtool fails to validate a function then it will use objdump to
  disassemble the entire file which is not very helpful when processing
  a large file (like vmlinux.o).

  Using libopcodes provides more control about the disassembly scope and
  output, and it is possible to disassemble a single instruction or
  a single function. Now when objtool fails to validate a function it
  will disassemble that single function instead of disassembling the
  entire file.

- Add the --trace <function> option to trace function validation

  Figuring out why a function validation has failed can be difficult because
  objtool checks all code flows (including alternatives) and maintains
  instructions states (in particular call frame information).

  The trace option allows to follow the function validation done by objtool
  instruction per instruction, see what objtool is doing and get function
  validation information. An output example is shown below.

Note: some changes are architecture specific (x86, powerpc, loongarch). So far,
I have only tested on x86, and some code might be x86 specific. Any feedback
about the behavior on powerpc and loongarch is welcome.

Thanks,

alex.


-----

Example: Trace the validation of the os_save() function in vmlinux.o

$ ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --sls --static-call --uaccess --prefix=16 --link --trace os_xsave -v vmlinux.o
os_xsave: validation begin
 65c20: os_xsave+0x0  push %r12				- state: cfa=rsp+16 r12=(cfa-16) stack_size=16 
 65c22: os_xsave+0x2  mov 0x0(%rip),%eax # alternatives_patched 
 65c28: os_xsave+0x8  push %rbp 			- state: cfa=rsp+24 rbp=(cfa-24) stack_size=24 
 65c29: os_xsave+0x9  mov %rdi,%rbp 
 65c2c: os_xsave+0xc  push %rbx 			- state: cfa=rsp+32 rbx=(cfa-32) stack_size=32 
 65c2d: os_xsave+0xd  mov 0x8(%rdi),%rbx 
 65c31: os_xsave+0x11 mov %rbx,%r12 
 65c34: os_xsave+0x14 shr $0x20,%r12 
 65c38: os_xsave+0x18 test %eax,%eax 
 65c3a: os_xsave+0x1a je 65c6a <os_xsave+0x4a> 		- jump taken
 65c6a: os_xsave+0x4a | ud2 
 65c6c: os_xsave+0x4c | jmp 65c3c <os_xsave+0x1c> 	- unconditional jump
 65c3c: os_xsave+0x1c | xor %edx,%edx 
 65c3e: os_xsave+0x1e | mov %rbx,%rsi 
 65c41: os_xsave+0x21 | mov %rbp,%rdi 
 65c44: os_xsave+0x24 | callq xfd_validate_state 	- call
 65c49: os_xsave+0x29 | mov %ebx,%eax 
 65c4b: os_xsave+0x2b | mov %r12d,%edx 
 65c4e: os_xsave+0x2e | <alternative.65c4e> alt 1/4 begin
 65c55: os_xsave+0x35 | | test %ebx,%ebx 
 65c57: os_xsave+0x37 | | jne 65c6e <os_xsave+0x4e> 	- jump taken
 65c6e: os_xsave+0x4e | | | ud2 
 65c70: os_xsave+0x50 | | | pop %rbx 			- state: cfa=rsp+24 rbx=<undef> stack_size=24 
 65c71: os_xsave+0x51 | | | pop %rbp 			- state: cfa=rsp+16 rbp=<undef> stack_size=16 
 65c72: os_xsave+0x52 | | | pop %r12 			- state: cfa=rsp+8 r12=<undef> stack_size=8 
 65c74: os_xsave+0x54 | | | xor %eax,%eax 
 65c76: os_xsave+0x56 | | | xor %edx,%edx 
 65c78: os_xsave+0x58 | | | xor %esi,%esi 
 65c7a: os_xsave+0x5a | | | xor %edi,%edi 
 65c7c: os_xsave+0x5c | | | jmpq __x86_return_thunk 	- return
 65c57: os_xsave+0x37 | | jne 65c6e <os_xsave+0x4e> 	- jump not taken
 65c59: os_xsave+0x39 | | pop %rbx 			- state: cfa=rsp+24 rbx=<undef> stack_size=24 
 65c5a: os_xsave+0x3a | | pop %rbp 			- state: cfa=rsp+16 rbp=<undef> stack_size=16 
 65c5b: os_xsave+0x3b | | pop %r12 			- state: cfa=rsp+8 r12=<undef> stack_size=8 
 65c5d: os_xsave+0x3d | | xor %eax,%eax 
 65c5f: os_xsave+0x3f | | xor %edx,%edx 
 65c61: os_xsave+0x41 | | xor %esi,%esi 
 65c63: os_xsave+0x43 | | xor %edi,%edi 
 65c65: os_xsave+0x45 | | jmpq __x86_return_thunk - return
                      | <alternative.65c4e> alt 1/4 end
 65c4e: os_xsave+0x2e | <alternative.65c4e> alt 2/4 begin
 1c3d: .altinstr_replacement+0x1c3d | | xsaves64 0x40(%rbp) 
 65c53: os_xsave+0x33 | | xor %ebx,%ebx 
 65c55: os_xsave+0x35 | | test %ebx,%ebx - already visited
                      | <alternative.65c4e> alt 2/4 end
 65c4e: os_xsave+0x2e | <alternative.65c4e> alt 3/4 begin
 1c38: .altinstr_replacement+0x1c38 | | xsavec64 0x40(%rbp) 
 65c53: os_xsave+0x33 | | xor %ebx,%ebx - already visited
                      | <alternative.65c4e> alt 3/4 end
 65c4e: os_xsave+0x2e | <alternative.65c4e> alt 4/4 begin
 1c33: .altinstr_replacement+0x1c33 | | xsaveopt64 0x40(%rbp) 
 65c53: os_xsave+0x33 | | xor %ebx,%ebx - already visited
                      | <alternative.65c4e> alt 4/4 end
 65c4e: os_xsave+0x2e | <alternative.65c4e> alt default
 65c4e: os_xsave+0x2e | xsave64 0x40(%rbp) 
 65c53: os_xsave+0x33 | xor %ebx,%ebx - already visited
 65c3a: os_xsave+0x1a je 65c6a <os_xsave+0x4a> - jump not taken
 65c3c: os_xsave+0x1c xor %edx,%edx - already visited
os_xsave: validation end

-----

Alexandre Chartre (13):
  objtool: Move disassembly functions to a separated file
  objtool: Create disassembly context
  objtool: Disassemble code with libopcodes instead of running objdump
  objtool: Print symbol during disassembly
  objtool: Store instruction disassembly result
  objtool: Disassemble instruction on warning or backtrace
  objtool: Extract code to validate instruction from the validate branch
    loop
  objtool: Record symbol name max length
  objtool: Add option to trace function validation
  objtool: Trace instruction state changes during function validation
  objtool: Improve register reporting during function validation
  objtool: Improve tracing of alternative instructions
  objtool: Do not validate IBT for .return_sites and .call_sites

 tools/objtool/Build                     |   1 +
 tools/objtool/Makefile                  |   2 +-
 tools/objtool/arch/loongarch/decode.c   |  17 +
 tools/objtool/arch/powerpc/decode.c     |  18 +
 tools/objtool/arch/x86/decode.c         |  15 +
 tools/objtool/builtin-check.c           |   1 +
 tools/objtool/check.c                   | 829 ++++++++++++++++--------
 tools/objtool/disas.c                   | 452 +++++++++++++
 tools/objtool/include/objtool/arch.h    |   7 +
 tools/objtool/include/objtool/builtin.h |   1 +
 tools/objtool/include/objtool/check.h   |  29 +
 tools/objtool/include/objtool/warn.h    |  17 +-
 12 files changed, 1122 insertions(+), 267 deletions(-)
 create mode 100644 tools/objtool/disas.c

-- 
2.43.5


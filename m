Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05D21C9E1
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345038; cv=none; b=FC6glZJE5uVvPHOAT8Kr2Bzqotlbsmn+A1k1mfwzH0RCGkvbYQXCNfNdGuEUwTBRTtntOe2qyANWYCoTEDsEwHbx11fh/7QFnQSy/VT4Z929LXfKyqi1DYd9tiqoW5R0FM1nDpJVw/3ArxQaMWfDkAAK6yajhaDQiSHXq2gyNkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345038; c=relaxed/simple;
	bh=zpquV1K3VNIXhf0opg2S8MyoJf4ERffm7hSzOlDaULU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WvrKe+SOB/llurToZR07plzF//qY42pMKJ7IIe6n9ftkJyDL6reZHowcQiNbIp+Nwtj3r25xB2db08w1cDn9fRxJ02evoTJv05PFt6YCyGaYEex+bERDAFnxeLknq6Avcrz1tCV5Nv4Apv3PaUUGl63QHsrKNYkJ3I9ONXYNv0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gThwBeUG; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gThwBeUG"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMavi014891;
	Thu, 19 Jun 2025 14:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=cVqRMjPYKnGU/FFS6opDnVt06YrAq
	eTZJzp+SOqNaAQ=; b=gThwBeUGvv7UsRVzlzY+mFWB1cdh7qCG/K0p8m1zafAxZ
	lroPS7sNeaMXF4eY6A5wIZ4JsIsnedSl1AjWGKRvzmP5cQ//mDIexrbomEGHz876
	f2oPO0Orkvw2nWIDZ0in4lTIVRIkFBszUBWb/HUCwpMP8sBEJERJBoFoiqQ9ZUPP
	QfdkfYwrGkJiH/frcDkvTUFrxmfJJx9iA+wloXQkFO87xQkmUJ5sj9R3Z3EwVGtv
	W+mXOakTdV3CpkWFATlS6iKT5nmybjcIs5qPbeDdtwpWOReue10AQwF+wyk6NaM4
	GXG7ZG9TkXQQlOYLeLeXRiYhAyJv0In3jdvxArucw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4t4af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDLCjM023045;
	Thu, 19 Jun 2025 14:57:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8dtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:01 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0J9008257;
	Thu, 19 Jun 2025 14:57:00 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-1;
	Thu, 19 Jun 2025 14:57:00 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 00/17] objtool: Function validation tracing
Date: Thu, 19 Jun 2025 16:56:42 +0200
Message-ID: <20250619145659.1377970-1-alexandre.chartre@oracle.com>
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
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX1V1va7bmihJe J4j39zH6jXDjdohCJ1xqLVZZmVlyc0jjD7pmJ55Y9ktj1Ta191Oe83MpSrRob1ANy+v8gc44yjB +pS3VeH5YwoWe9EZiFGcD1fDmJ75YjDM/4/33tQ0cm83NWbvJDGIwQXgjeZtfjLziGBAeky2TDv
 L6pSrDcpybYQ0T2C6mQoTlH959Ca42q4jYiCIN7pH+2CqVUAdw/aRnBHHWPy464iQoF+zmQBuxz rBJkz4SYqzmphJ4YolC/3SDPbYVx36z1Os9aff3cxgErPgZ7OAZO5Hh77634ygN92kb/sPiUcQ0 lXtzz5CexE/tm6GEAuWDQcaa26dvxzLEthhACyatabvMEIWRvlevqiREXuItdTzWYlO7o9y1MA8
 EQB7F43BXHeBiMvU0tiOOQRIi1dF5F1b+5huNH8T5dLC0eE3DOCjt04bHpKaoH6+X/EH8HdN
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=6854253e b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=O8uw_VhOA2kUh5_ajB0A:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: 8IzhqVzn7DAmxc8QZUoorB4GbkI5hlYA
X-Proofpoint-ORIG-GUID: 8IzhqVzn7DAmxc8QZUoorB4GbkI5hlYA

Hi,

Version v2 of this RFC addresses all comments from Josh and Peter,
in particular:

- add --disas option to disassemble functions
- do not fail the build if libopcodes is not available. Instead objtool
  is then built without disassembly support. In that case, objtool prints
  a warning message if trying to use disassembly.

  Example:
  $ ./tools/objtool/objtool --disas --link vmlinux.o
  vmlinux.o: warning: objtool: Rebuild with libopcodes for disassembly support
  
- remove dbuffer
- rename VTRACE* to TRACE*
- add trace.[ch] for trace-related functions and macros


This RFC provides the following changes to objtool.

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

- Add the --disas <function> option to disassemble functions

  Disassembly is done using libopcodes and it will show the different code
  alternatives.

Note: some changes are architecture specific (x86, powerpc, loongarch). Any
feedback about the behavior on powerpc and loongarch is welcome.

Thanks,

alex.


-----

Examples:
=========

Example 1 (--trace option): Trace the validation of the os_save() function
--------------------------------------------------------------------------

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


Example 2 (--disas option): Disassemble perf_get_x86_pmu_capability()
---------------------------------------------------------------------

$ ./tools/objtool/objtool --disas=perf_get_x86_pmu_capability --link vmlinux.o
perf_get_x86_pmu_capability:
  d000:  perf_get_x86_pmu_capability         endbr64                                                   
  d004:  perf_get_x86_pmu_capability+0x4     callq  __fentry__                                         
  d009:  perf_get_x86_pmu_capability+0x9     mov    %rdi,%rdx                                          
                                             <alternative.d00c> default - begin
  d00c:  perf_get_x86_pmu_capability+0xc     | jmpq   .altinstr_aux+0x90                               
                                             <alternative.d00c> default - end
                                             <alternative.d00c> 1/2 - begin
                                             | <fake nop> (5 bytes)                                    
                                             <alternative.d00c> 1/2 end
                                             <alternative.d00c> 2/2 - begin
   5e5:  .altinstr_replacement+0x5e5         | jmpq   perf_get_x86_pmu_capability+0x3f                 
                                             <alternative.d00c> 2/2 end
  d011:  perf_get_x86_pmu_capability+0x11    ud2                                                       
  d013:  perf_get_x86_pmu_capability+0x13    movq   $0x0,(%rdx)                                        
  d01a:  perf_get_x86_pmu_capability+0x1a    movq   $0x0,0x8(%rdx)                                     
  d022:  perf_get_x86_pmu_capability+0x22    movq   $0x0,0x10(%rdx)                                    
  d02a:  perf_get_x86_pmu_capability+0x2a    movq   $0x0,0x18(%rdx)                                    
  d032:  perf_get_x86_pmu_capability+0x32    xor    %eax,%eax                                          
  d034:  perf_get_x86_pmu_capability+0x34    xor    %edx,%edx                                          
  d036:  perf_get_x86_pmu_capability+0x36    xor    %ecx,%ecx                                          
  d038:  perf_get_x86_pmu_capability+0x38    xor    %edi,%edi                                          
  d03a:  perf_get_x86_pmu_capability+0x3a    jmpq   __x86_return_thunk                                 
  d03f:  perf_get_x86_pmu_capability+0x3f    cmpq   $0x0,0x0(%rip)        # x86_pmu+0x10               
  d047:  perf_get_x86_pmu_capability+0x47    je     d013 <perf_get_x86_pmu_capability+0x13>            
  d049:  perf_get_x86_pmu_capability+0x49    mov    0x0(%rip),%eax        # x86_pmu+0x8                
  d04f:  perf_get_x86_pmu_capability+0x4f    mov    %eax,(%rdi)                                        
                                             <jump alternative.d051> default
  d051:  perf_get_x86_pmu_capability+0x51    | xchg   %ax,%ax                                          
                                             <jump alternative.d051> else
  d051:  perf_get_x86_pmu_capability+0x51    | jmp    d053 <perf_get_x86_pmu_capability+0x53>
                                             <jump alternative.d051> end
  d053:  perf_get_x86_pmu_capability+0x53    mov    0x0(%rip),%rdi        # x86_pmu+0xd8               
                                             <alternative.d05a> default - begin
  d05a:  perf_get_x86_pmu_capability+0x5a    | callq  __sw_hweight64                                   
                                             <alternative.d05a> default - end
                                             <alternative.d05a> 1/1 - begin
   5ea:  .altinstr_replacement+0x5ea         | popcnt %rdi,%rax                                        
                                             <alternative.d05a> 1/1 end
  d05f:  perf_get_x86_pmu_capability+0x5f    mov    %eax,0x4(%rdx)                                     
                                             <jump alternative.d062> default
  d062:  perf_get_x86_pmu_capability+0x62    | xchg   %ax,%ax                                          
                                             <jump alternative.d062> else
  d062:  perf_get_x86_pmu_capability+0x62    | jmp    d064 <perf_get_x86_pmu_capability+0x64>
                                             <jump alternative.d062> end
  d064:  perf_get_x86_pmu_capability+0x64    mov    0x0(%rip),%rdi        # x86_pmu+0xe0               
                                             <alternative.d06b> default - begin
  d06b:  perf_get_x86_pmu_capability+0x6b    | callq  __sw_hweight64                                   
                                             <alternative.d06b> default - end
                                             <alternative.d06b> 1/1 - begin
   5ef:  .altinstr_replacement+0x5ef         | popcnt %rdi,%rax                                        
                                             <alternative.d06b> 1/1 end
  d070:  perf_get_x86_pmu_capability+0x70    mov    %eax,0x8(%rdx)                                     
  d073:  perf_get_x86_pmu_capability+0x73    mov    0x0(%rip),%eax        # x86_pmu+0xf8               
  d079:  perf_get_x86_pmu_capability+0x79    mov    %eax,0xc(%rdx)                                     
  d07c:  perf_get_x86_pmu_capability+0x7c    mov    %eax,0x10(%rdx)                                    
  d07f:  perf_get_x86_pmu_capability+0x7f    mov    0x0(%rip),%rax        # x86_pmu+0x108              
  d086:  perf_get_x86_pmu_capability+0x86    mov    %eax,0x14(%rdx)                                    
  d089:  perf_get_x86_pmu_capability+0x89    mov    0x0(%rip),%eax        # x86_pmu+0x110              
  d08f:  perf_get_x86_pmu_capability+0x8f    mov    %eax,0x18(%rdx)                                    
  d092:  perf_get_x86_pmu_capability+0x92    movzbl 0x0(%rip),%ecx        # x86_pmu+0x1d1              
  d099:  perf_get_x86_pmu_capability+0x99    movzbl 0x1c(%rdx),%eax                                    
  d09d:  perf_get_x86_pmu_capability+0x9d    shr    %cl                                                
  d09f:  perf_get_x86_pmu_capability+0x9f    and    $0x1,%ecx                                          
  d0a2:  perf_get_x86_pmu_capability+0xa2    and    $0xfffffffe,%eax                                   
  d0a5:  perf_get_x86_pmu_capability+0xa5    or     %ecx,%eax                                          
  d0a7:  perf_get_x86_pmu_capability+0xa7    mov    %al,0x1c(%rdx)                                     
  d0aa:  perf_get_x86_pmu_capability+0xaa    xor    %eax,%eax                                          
  d0ac:  perf_get_x86_pmu_capability+0xac    xor    %edx,%edx                                          
  d0ae:  perf_get_x86_pmu_capability+0xae    xor    %ecx,%ecx                                          
  d0b0:  perf_get_x86_pmu_capability+0xb0    xor    %edi,%edi                                          
  d0b2:  perf_get_x86_pmu_capability+0xb2    jmpq   __x86_return_thunk                                 


-----

Alexandre Chartre (17):
  objtool: Move disassembly functions to a separated file
  objtool: Create disassembly context
  objtool: Disassemble code with libopcodes instead of running objdump
  tool build: Remove annoying newline in build output
  objtool: Print symbol during disassembly
  objtool: Improve offstr() output
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
  objtool: Add the --disas=<function-pattern> action
  objtool: Disassemble all alternatives when using --disas

 tools/build/Makefile.feature            |   4 +-
 tools/objtool/Build                     |   3 +
 tools/objtool/Makefile                  |  22 +
 tools/objtool/arch/loongarch/decode.c   |  30 ++
 tools/objtool/arch/powerpc/decode.c     |  31 ++
 tools/objtool/arch/x86/decode.c         |  34 ++
 tools/objtool/builtin-check.c           |   5 +-
 tools/objtool/check.c                   | 687 ++++++++++++++----------
 tools/objtool/disas.c                   | 569 ++++++++++++++++++++
 tools/objtool/include/objtool/arch.h    |  13 +
 tools/objtool/include/objtool/builtin.h |   2 +
 tools/objtool/include/objtool/check.h   |  32 +-
 tools/objtool/include/objtool/disas.h   |  69 +++
 tools/objtool/include/objtool/trace.h   | 111 ++++
 tools/objtool/include/objtool/warn.h    |  33 +-
 tools/objtool/trace.c                   | 147 +++++
 16 files changed, 1489 insertions(+), 303 deletions(-)
 create mode 100644 tools/objtool/disas.c
 create mode 100644 tools/objtool/include/objtool/disas.h
 create mode 100644 tools/objtool/include/objtool/trace.h
 create mode 100644 tools/objtool/trace.c

-- 
2.43.5


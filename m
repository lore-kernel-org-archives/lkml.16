Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913C41FECB1
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746442329; cv=none; b=T359b7ViUkqqwFHjCMV+Un2a2A7fJbsdHE3ERQHEQMWJWiMzLU/KM7OHm16KQDyT9gEK+q8UNlirRyip3tGyzxJSgJOoUF8ccpJLmZhekdwLcFTaMj9PCC3Vz8CO5PY/BcWDr2OsBiioSCqQcKetWI6DeBLNI82bR8sWdWUukoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746442329; c=relaxed/simple;
	bh=e09ptpHc1wY1nf4tTlK0LrNA3OGc5FL/pSYLfGOAbNQ=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=O42scm8re11MLD15Jtent3XwY9pxXoNy+jzRzssOVMkULpwuEslZThbZXUjpOMT75jR08BYmMinh5uiQlMlDLefvcfHCA7zVJ8P00nQaT4Z+Qu9C/JxbU+6SQ1NAOy4q86avQOIpVIGathUlZzY+DuHofREaYCku1C+6IxBqEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B7aDC7pP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B7aDC7pP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746442325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=sq8oqpkEbt6VQZ1/grnXYkgovjqr9Z/hWjCihFBzl8g=;
	b=B7aDC7pPbCRWPkDXjrWGBc8dl16j7rFJF+KQ3lc6VQCmp/LA9ZrUD205RhzBjiMxjFHhn5
	iGBaH4TFALm9NaKpM7Vmqe29cr4buiGyLH2NMw3JV//gT6BQeD9FrfL9ub0FqhchV2LogI
	exBs4iQwL6KynSepFmskO1OodBrDZ8U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-Rct9yHyVMz68G-mGBgcgcA-1; Mon, 05 May 2025 06:52:04 -0400
X-MC-Unique: Rct9yHyVMz68G-mGBgcgcA-1
X-Mimecast-MFC-AGG-ID: Rct9yHyVMz68G-mGBgcgcA_1746442323
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3978ef9a284so1064454f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 03:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746442323; x=1747047123;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sq8oqpkEbt6VQZ1/grnXYkgovjqr9Z/hWjCihFBzl8g=;
        b=FC0Q/96xujgBWgfAGMXtO4j6gumy4yXtsnxygd0sJlbnV6fO3HpuMmCjl1eaF8uTqK
         4I3EME/Xq5+1m5Ce/bxThblePvODjZeaq+hhylYRI/Lb0nxHOkE9zZMHKd0KvE/D4I2e
         izABVWcEwAH8TfgwdRs71ncDQXYBf/myPAfAYxg3CHvY8cq3IiQn+TkIySGdCruFotkj
         s80lwwohU1IIXNHdnEK1idlxmmcEySPCRlgAUIpCwX8Cbx6TSlG1qJMi7Nn4NtfzWB2s
         zlB0u8Ki/ufBy5Lsd+XJh6lO7xRcfYfl7u/GgEg4dhwnJq5Z3Hod9lXaGtStrFaOmPhp
         FYng==
X-Forwarded-Encrypted: i=1; AJvYcCWLxiYpAfueav+YvHE1KzY0kO5W8D3+Y6bxDLEMAnR2E3kdjeOVSq1hpXU0peFBRLtJ3PPhJqMItRiRH0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSii8QZ6fvXnEWce71P8t4KfJf90rfCS5aR3rpF4QjIcTNzyrD
	fWAG1vAHnvf+YPE3OucmTzfjLIudaSTwcIl88oLmI/ee0kMWFcITMSNGLXSPwhyTbh+BOClV6Gt
	YO8C0ZyIupy4RnKf0fqpPsgSMzjHk/XeJoJAxrb1WMLObHCN47w5rGfuzr0r04g==
X-Gm-Gg: ASbGncsvhC93c4Lj+G/YJZhhHcoBaKtJtZQ9r9gVSAtrra6HKo0CeFGI2iX/6cJ95pq
	gTotw8wPrY1RyEIyL/4P8QYPyFZ7IEb5h+3VUVYrqtp7ln7bTPkSUwvclAkz0KnsC8SdzwY7IMB
	8Qol+ZuKkOngmjDBduM03cX5212XPaf0VpQIzZTwbUYk71mqb+NDRs/iTPU0ozSYkIXjduwn61S
	0gkAqcSdf7/+gKnuMi5iB1yPbkmx6SLTE3lyJBoVTrTSlODcIdv5h5G8NWYKPjsUdo/kol8PVd2
	U7opXYlrzaSgEJbIWZ6dZ5vu0oT6A3cOvJgotjSpBLvr8P4Zeq9J5rhpEsOQ
X-Received: by 2002:a5d:584a:0:b0:39c:1424:2827 with SMTP id ffacd0b85a97d-3a09fd72d2fmr5235988f8f.15.1746442322917;
        Mon, 05 May 2025 03:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGavxMvTs7adVpf3ebEvODcNsebFSIFRc5x5LOjIYUhYTGyIAbpQGLg5qpK8yqHQ/F0lIAlRQ==
X-Received: by 2002:a5d:584a:0:b0:39c:1424:2827 with SMTP id ffacd0b85a97d-3a09fd72d2fmr5235976f8f.15.1746442322542;
        Mon, 05 May 2025 03:52:02 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a09a002899sm9624936f8f.0.2025.05.05.03.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 03:52:02 -0700 (PDT)
Date: Mon, 5 May 2025 12:52:00 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
    Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: LM regression: fce886a60207 KVM: arm64: Plumb the pKVM MMU in KVM
Message-ID: <3f5db4c7-ccce-fb95-595c-692fa7aad227@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463806286-1042922980-1746442321=:11509"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463806286-1042922980-1746442321=:11509
Content-Type: text/plain; format=flowed; charset=US-ASCII

Hey,

Doing back and forth migrations currently fails on arm after a couple iterations.
During the failing migration KVM_RUN exits via guest_abort and returns -ENOMEM.
I can reliably reproduce this by migrating between 2 qemu instances on an ampere
altra machine. This fails after < 5 iterations. In this case qemu would spit out
smth like this (other than that - nothing in the logs):

error: kvm run failed Cannot allocate memory
  PC=0000aaaae7d48590 X00=0000aaaae80a2e00 X01=0000aaaae7ea2fc0
X02=0000000001d3a5d0 X03=0000aaaae7eace8c X04=000000003b9aca00
X05=000000000000004a X06=000000000000004a X07=0000000028000000
X08=0000000000001d70 X09=0000000000000018 X10=000144b7d0000000
X11=00ffffffffffffff X12=000000008378f367 X13=0000aaab1a202d70
X14=0000000000000000 X15=0000000000000000 X16=0000ffffa2e2f7a8
X17=0000ffffa2541f20 X18=000000000000a000 X19=84bfda6288cf2dd6
X20=0000aaab1a1f1ce0 X21=000000007fffffff X22=0000ffffc5431788
X23=0000aaab1a17db60 X24=0000ffffc5431770 X25=0000000100000000
X26=0000004100000000 X27=0000000000000001 X28=0000aaab1a1f1c20
X29=0000ffffc54316d0 X30=0000aaaae7f8cd24  SP=0000ffffc5431650
PSTATE=20001000 --C- EL0t

Guest and host are otherwise idle, kvm is in normal VHE mode.

Git bisect points to (fce886a60207 "KVM: arm64: Plumb the pKVM MMU in KVM")
I also double checked that by reverting this commit on top of 6.14.

Sebastian
---1463806286-1042922980-1746442321=:11509
Content-Type: text/plain; name=bisect.log
Content-Transfer-Encoding: BASE64
Content-ID: <7f7f94bd-ec02-d458-7ef4-4859ab216191@redhat.com>
Content-Description: 
Content-Disposition: attachment; filename=bisect.log

Z2l0IGJpc2VjdCBsb2cNCiMgYmFkOiBbMzhmZWMxMGViNjBkNjg3ZTMwYzhj
NmI1NDIwZDg2ZTgxNDlmNzU1N10gTGludXggNi4xNA0KIyBnb29kOiBbZmZk
Mjk0ZDM0NmQxODViNzBlMjhiMWEyOGFiZTM2N2JiZmU1M2MwNF0gTGludXgg
Ni4xMw0KZ2l0IGJpc2VjdCBzdGFydCAnYmFkJyAnZ29vZCcNCiMgZ29vZDog
WzJjOGQyYTUxMGMxNWMwMDM3NDllNDNhYzJiOGUxYmM3OWE3YTAwZDZdIE1l
cmdlIHRhZyAnc291bmQtNi4xNC1yYzEnIG9mIGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXdhaS9zb3VuZA0KZ2l0
IGJpc2VjdCBnb29kIDJjOGQyYTUxMGMxNWMwMDM3NDllNDNhYzJiOGUxYmM3
OWE3YTAwZDYNCiMgZ29vZDogWzlmZjI4ZjJmYWQ2N2UxNzNlZDI1YjhjM2Ex
ODNiMTVkYTU0NDVkMmRdIE1lcmdlIHRhZyAnbG9vbmdhcmNoLTYuMTQnIG9m
IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9jaGVuaHVhY2FpL2xpbnV4LWxvb25nc29uDQpnaXQgYmlzZWN0IGdvb2Qg
OWZmMjhmMmZhZDY3ZTE3M2VkMjViOGMzYTE4M2IxNWRhNTQ0NWQyZA0KIyBi
YWQ6IFsyNDM4OTkwNzZjM2VmZGY5OGQ4ZTkyMmE4MDI4OTY0MjRhNTk3NTgw
XSBNZXJnZSB0YWcgJ3J1c3QtZml4ZXMtNi4xNC0yJyBvZiBnaXQ6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvb2plZGEvbGlu
dXgNCmdpdCBiaXNlY3QgYmFkIDI0Mzg5OTA3NmMzZWZkZjk4ZDhlOTIyYTgw
Mjg5NjQyNGE1OTc1ODANCiMgYmFkOiBbOTVkN2U4MjI2MTA2ZTM0NDViMGQ4
NzcwMTVmNDE5MmM0N2QyMzYzN10gTWVyZ2UgdGFnICdhdGEtNi4xNC1yYzEt
cGFydDInIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9saWJhdGEvbGludXgNCmdpdCBiaXNlY3QgYmFkIDk1ZDdl
ODIyNjEwNmUzNDQ1YjBkODc3MDE1ZjQxOTJjNDdkMjM2MzcNCiMgYmFkOiBb
N2M3NzVjNjA1NmQwN2ViNzc3ZjM3YzdhYzEzNDAxMTViMjdkYzlmOF0gTWVy
Z2UgdGFnICdkbWFlbmdpbmUtNi4xNC1yYzEnIG9mIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92a291bC9kbWFlbmdp
bmUNCmdpdCBiaXNlY3QgYmFkIDdjNzc1YzYwNTZkMDdlYjc3N2YzN2M3YWMx
MzQwMTE1YjI3ZGM5ZjgNCiMgYmFkOiBbN2M3NzVjNjA1NmQwN2ViNzc3ZjM3
YzdhYzEzNDAxMTViMjdkYzlmOF0gTWVyZ2UgdGFnICdkbWFlbmdpbmUtNi4x
NC1yYzEnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC92a291bC9kbWFlbmdpbmUNCmdpdCBiaXNlY3QgYmFkIDdj
Nzc1YzYwNTZkMDdlYjc3N2YzN2M3YWMxMzQwMTE1YjI3ZGM5ZjgNCiMgYmFk
OiBbZjc4NTY5MmZmNTQ1YWVjYjUxN2QyNjA5ODY0ZTFjNmQ4MzgzMjllNl0g
TWVyZ2UgdGFnICdzdG9wLW1hY2hpbmUuMjAyNS4wMS4yOGEnIG9mIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wYXVs
bWNrL2xpbnV4LXJjdQ0KZ2l0IGJpc2VjdCBiYWQgZjc4NTY5MmZmNTQ1YWVj
YjUxN2QyNjA5ODY0ZTFjNmQ4MzgzMjllNg0KIyBiYWQ6IFswODA2MTJiMjk0
MmFiNzk0NzMwMzAyOWUxZmEzMzExN2I1MjgwZWNlXSBNZXJnZSBicmFuY2gg
a3ZtLWFybTY0L252LXRpbWVycyBpbnRvIGt2bWFybS1tYXN0ZXIvbmV4dA0K
Z2l0IGJpc2VjdCBiYWQgMDgwNjEyYjI5NDJhYjc5NDczMDMwMjllMWZhMzMx
MTdiNTI4MGVjZQ0KIyBiYWQ6IFtkMDY3MDEyOGQ0MmZhMTcwYmY4YmE4Nzhj
ZDIzNTA0YzVjNWNjY2M3XSBNZXJnZSBicmFuY2gga3ZtLWFybTY0L3Brdm0t
bnAtZ3Vlc3QgaW50byBrdm1hcm0tbWFzdGVyL25leHQNCmdpdCBiaXNlY3Qg
YmFkIGQwNjcwMTI4ZDQyZmExNzBiZjhiYTg3OGNkMjM1MDRjNWM1Y2NjYzcN
CiMgZ29vZDogW2M0YTZlZDg1NDU1OTc5ZWYzZmJhZGMyZjFiZGYxODczNGIw
ZWNlYTZdIEtWTTogYXJtNjQ6IFByb21vdGUgZ3Vlc3Qgb3duZXJzaGlwIGZv
ciBEQkd4VlIvREJHeENSIHJlYWRzDQpnaXQgYmlzZWN0IGdvb2QgYzRhNmVk
ODU0NTU5NzllZjNmYmFkYzJmMWJkZjE4NzM0YjBlY2VhNg0KIyBnb29kOiBb
ZDBiZDNlNjU3MGFlZTQyNzY2ZTdiZDg4NDczNGFlMDc4NjY3ZWExZV0gS1ZN
OiBhcm02NDogSW50cm9kdWNlIF9fcGt2bV9ob3N0X3NoYXJlX2d1ZXN0KCkN
CmdpdCBiaXNlY3QgZ29vZCBkMGJkM2U2NTcwYWVlNDI3NjZlN2JkODg0NzM0
YWUwNzg2NjdlYTFlDQojIGdvb2Q6IFs3NmYwYjE4YjNkYjU3ODY4ZmIwY2Fi
ZTY5MTIwMWFhZDMwODViNzEyXSBLVk06IGFybTY0OiBJbnRyb2R1Y2UgX19w
a3ZtX2hvc3RfbWt5b3VuZ19ndWVzdCgpDQpnaXQgYmlzZWN0IGdvb2QgNzZm
MGIxOGIzZGI1Nzg2OGZiMGNhYmU2OTEyMDFhYWQzMDg1YjcxMg0KIyBnb29k
OiBbZTkxMmVmZWQ0ODVhNGM1MGJkYzM5MzRhZTY0N2UyNTdlZjU2OGVmNl0g
S1ZNOiBhcm02NDogSW50cm9kdWNlIHRoZSBFTDEgcEtWTSBNTVUNCmdpdCBi
aXNlY3QgZ29vZCBlOTEyZWZlZDQ4NWE0YzUwYmRjMzkzNGFlNjQ3ZTI1N2Vm
NTY4ZWY2DQojIGJhZDogW2ZjZTg4NmE2MDIwNzM0ZDYyNTNjMmM1YTNiYzI4
NWUzODVjYzU0OTZdIEtWTTogYXJtNjQ6IFBsdW1iIHRoZSBwS1ZNIE1NVSBp
biBLVk0NCmdpdCBiaXNlY3QgYmFkIGZjZTg4NmE2MDIwNzM0ZDYyNTNjMmM1
YTNiYzI4NWUzODVjYzU0OTYNCiMgZmlyc3QgYmFkIGNvbW1pdDogW2ZjZTg4
NmE2MDIwNzM0ZDYyNTNjMmM1YTNiYzI4NWUzODVjYzU0OTZdIEtWTTogYXJt
NjQ6IFBsdW1iIHRoZSBwS1ZNIE1NVSBpbiBLVk0NCg==

---1463806286-1042922980-1746442321=:11509--


Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C240021E08D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602843; cv=none; b=q5MV5w5ZfBsRgt/IeUcIGKQxCf8xs5zfj/zsFWZ+/WFey2bcmN5pnfe/bcsl0CGu3I2aTmtAwMwFCCTanXZ8EOjob0qAnJw2HH4rKDu4skDjpXgj9evSQdTwvgiN6ILK6YyB+pLw1vuvV0ACO7mX9eh950DNRwfkp4rzEwAtNAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602843; c=relaxed/simple;
	bh=mBL+AxcF1xFwBIeV0kOlIFmh5j2V+v6TYuiEqLBkMG8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jzklDr0NcA2Edn9yZnZnZja1U2pttCdT8Hicg7K1LUmUMMQ8DeWL/+LHuSYV7DRNETxs95IjzOnVuH8vdbvqskbX0oMQnEm964XQp/kVhLuqw6sqgTN5bf4mjhYxgVFcB6nDvhgnp+pLj9rtjE3Thv32/FbdBDZKPIVJfwzJz0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BViOfMcB; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BViOfMcB"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so2029805a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745602841; x=1746207641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhG8eNK9TC64LN5c+PcqHDBAibvAi/qupep9hLzGVvg=;
        b=BViOfMcBeTYfSebp5b/2E6e00SUmpH8AhvAZabpaV1TTtTyVRRAk06GH5sLq5sgRu0
         wsIZTX/hwaQxvWp1jPeiKKqw+BxCIp6nNZ26+aS/cMBbp7O9oIf45s1BOKbbekBTW/2m
         L/Kd0aQgecujMhsUJXe5kFiivTNahkMd3eT9a7hM4d2uEkWPc3tD6UCp1Q9CRfNn0Mn+
         N2NGTGxRShKKztWN0zhpA7zzEE4he78nU7OuC9UGQL/cN4YrNTqj9mpTNHXhqpuwJ9Hu
         nxxm8xjaHz8MPBFNUNpUGQ7glZMWVuhN9movtkpyJyATJdVKkHPJ3Wi/X4KlWqFB5cNo
         IIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602841; x=1746207641;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DhG8eNK9TC64LN5c+PcqHDBAibvAi/qupep9hLzGVvg=;
        b=CnQ8BJi62sbY8Mvi/lBwqASreCsLFKrDQOH+MPvFt2K6KC/Z21CqrYw72s9oTkxQU7
         vT4i/3jJlsvK1xV0ttUVFPX/oBEE5Jdar4ovBeWnQdR/Kvo69re4Bzie37t+SdNyrxqX
         XYxnspPWHLLTy9MOeNEBz9AKZr59tSCQs4MzMnbd/6OHrBjt+W1ul1wl+U5xrUtjgxWZ
         mzc2xnlk8VU7DAucun5NkhpN+iNbNnTaIBOEQD4/OIWrD6+7FLMbqGXMOvtVghEC8z7o
         LJT0ovKmCnsWnkYNjwb826VxUEUB8EYe4jU8EsBLbt2J+UrKlOe0TqyfbxVZHcv/PF8l
         sywQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCv1DIQNc9iRHGnw/CN1DMaLLoSR5sDie4tpZYVBxlg7gPeODscolNg+LgU+5aN/onmpLpLY2KKoNaVMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3XuSSGphXlnqXxv27j4uYqYCvDVESRpwRbzVyyoQHqeuw0hdq
	qnwrLPK3/XDo5z8KjS0I0duf5oBqs2NOgsmUQ3OFau7Za/gKuvHoHskoE9Od2Gfv0sijF4sy2Oj
	tbg==
X-Google-Smtp-Source: AGHT+IFC30qTPGBsqU8uN7Kv++uJDjQV8EX1lJacsyhIimEuVAg/AiMZRK7iyZUVZpVSoZ48Rc/R1PHMSDI=
X-Received: from pjbsi3.prod.google.com ([2002:a17:90b:5283:b0:308:670e:aa2c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f10:b0:2fe:b937:2a51
 with SMTP id 98e67ed59e1d1-309f7e8eefbmr5438839a91.33.1745602840904; Fri, 25
 Apr 2025 10:40:40 -0700 (PDT)
Date: Fri, 25 Apr 2025 10:40:39 -0700
In-Reply-To: <DM8PR11MB5750AB0E790096AFF9AFD3AFE7842@DM8PR11MB5750.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250415115213.291449-1-elena.reshetova@intel.com>
 <20250415115213.291449-3-elena.reshetova@intel.com> <aAJn8tgubjT5t7DB@google.com>
 <f5cb3c37589791b2004a100ca3ea3deb9e1ae708.camel@intel.com>
 <aAefmNVRFc3me6QQ@google.com> <DM8PR11MB5750B37305B3B1FAE4F42D3AE7852@DM8PR11MB5750.namprd11.prod.outlook.com>
 <aAo_2MPGOkOciNuM@google.com> <DM8PR11MB5750D373790399E324B98A18E7852@DM8PR11MB5750.namprd11.prod.outlook.com>
 <aApgOqHvsYNd-yht@google.com> <DM8PR11MB5750AB0E790096AFF9AFD3AFE7842@DM8PR11MB5750.namprd11.prod.outlook.com>
Message-ID: <aAutUaQvgEliXPUs@google.com>
Subject: Re: [PATCH v3 2/2] x86/sgx: Implement EUPDATESVN and
 opportunistically call it during first EPC page alloc
From: Sean Christopherson <seanjc@google.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: "jarkko@kernel.org" <jarkko@kernel.org>, Kai Huang <kai.huang@intel.com>, 
	Dave Hansen <dave.hansen@intel.com>, 
	"linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>, Vincent Scarlata <vincent.r.scarlata@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Chong Cai <chongc@google.com>, 
	Asit K Mallick <asit.k.mallick@intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bondarn@google.com" <bondarn@google.com>, 
	"dionnaglaze@google.com" <dionnaglaze@google.com>, Scott Raynor <scott.raynor@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025, Elena Reshetova wrote:
> > On Thu, Apr 24, 2025, Elena Reshetova wrote:
> > Userspace generally won't care about a 10us delay when destroying a
> > process, but a 10us delay to launch an enclave could be quite problemat=
ic,
> > e.g. in the TDX use case where enclaves may be launched on-demand in
> > response to a guest attestation request.
>=20
> Ok, but in this case, you are hooking both: create and release.=20
> I guess your line of thinking is that in most of the cases it will be han=
dled by
> a release flow when destroying enclaves, but in cases we happen to need
> to update a machine which doesn=E2=80=99t have a single enclave yet, the =
create flow
> will be used. The problem is that if you look at the instruction definiti=
on,=20
> we won't save too much when executing this in release flow (Kai I think a=
lready pointed
> this out):
>=20
> IF (Other instruction is accessing EPC) THEN
>  RFLAGS.ZF :=3D 1
>  RAX :=3D SGX_LOCKFAIL;
>  GOTO ERROR_EXIT;
> FI
> (* Verify EPC is ready *)
> IF (the EPC contains any valid pages) THEN
>  RFLAGS.ZF :=3D 1;
>  RAX :=3D SGX_EPC_NOT_READY;
>  GOTO ERROR_EXIT;
> FI
> (* Refresh paging key *) =20
> IF (NOT RDSEED(&TMP_KEY, 16)) THEN
>  RFLAGS.ZF :=3D 1;
>  RAX :=3D SGX_INSUFFICIENT_ENTROPY;
> GOTO ERROR_EXIT;
> FI
> (* Commit *)
> CR_BASE_KEY :=3D TMP_KEY;
> TMP_CPUSVN :=3D CR_CPUSVN;
> (* Update CPUSVN to current minimum patch even if locked *)
> (* Determine if info status is needed *)
>=20
> ----------------------------
> All above would be done anyhow on create even if we successfully
> executed it on release previously (( And then finally we go into:

Ah, so the slow part happens no matter what.

> IF (TMP_CPUSVN =3D CR_CPUSVN) THEN
>  RFLAGS.CF :=3D 1;
>  RAX :=3D SGX_NO_UPDATE;
> FI
> ERROR_EXIT:
>=20
> >=20
> > If the update time is tiny, then I agree that hooking release would pro=
bably do
> > more harm than good.
>=20
> So, it is not that the time is tiny, it is like we will do it twice,
> unnecessary and potentially quite long in both cases (taking RDSEED step =
into
> account).
>=20
> The reason why the instruction is defined this way is that it was not
> intended originally to be inserted into some existing SGX flows, but was
> envisioned to be standalone cmd for the host orchestrator to execute once=
 it
> thinks system is ready.=20

So then why on earth is the kernel implementing automatic updates?  I read =
back
through most of the cover letters, and IIUC, we went straight from "destroy=
 all
enclaves and force an update" to "blindly try to do EUPDATESVN every time t=
he
number of enclaves goes from 0=3D>1".  Those are essentially the two most e=
xtreme
options.

Even worse, rejecting enclave creation on EUPDATESVN failure represents an =
ABI
change, i.e. could break existing setups.

Why not simply add an ioctl() or sysfs knob to let userspace trigger EUPDAT=
ESVN?
If there are pages in the EPC, return -EBUSY.  That would give userspace fu=
ll
control of the update policy, and would allow for a super simple implementa=
tion
in the kernel.  Userspace should darn well know when it's an appropriate ti=
me to
do an SVN update, e.g. after userspace has initiated a ucode update, period=
ically
if it wants to, after the last TDX VM is destroyed, etc.

Assuming TDX module updates are coming down the pipe, with my KVM maintaine=
r hat
on, that is exactly how I will "request" the module be updated.  Userspace =
initiates
the update and is therefore responsible for knowing when to do (or not do) =
an update.
The kernel's job is purely to do the actual update and ensure correctness/s=
afety,
e.g. reject the module update if there are active TDX VMs.

That is also how SEV firmware updates are being implemented.  Userspace is
responsible for stopping any VM types that aren't compatible with conccuren=
t
updates.

I see no reason to do something different for SGX.

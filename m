Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EA62F362B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750890430; cv=none; b=CBgs3YoKddBtI9FcrZc99739lovdq1UMB+ChnL9/hC365XV7f7EjY4y8C9l/bKx5ECrVANGpuqiM8hszihKTcIf7Uez3hNszT8DW2jzDpguz/wr7VoYNm62YZkqk+J+gEZEcZ0zipi9+Xr31/poaTW+qcbla6GnNqjCkpbLtZIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750890430; c=relaxed/simple;
	bh=AgMIY7/alAyOVuvx/XYCb5AKG/9HuGSDAcN7JGIYOTs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CzRQwL5/90H/JTQ3tdEgQwwQp74WqI4b6l5mcChJqSSboOdhXHygCs6wWt/mPbVUBURVKsGRokF7L2j+gqUVBf3KFDV3ffjoW8FZGZxaY+Iqpo+28zmOPn7ofVaW49bf87uUtphVIoB68BVpkNGLzEM/LnpB8ZhNy5BIQjO8Q94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UoikHTMX; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UoikHTMX"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso151306a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750890428; x=1751495228; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cAq5XqUsWKP02wGqBYM6J6LlRfdkCsvvuKjaBBLj1lY=;
        b=UoikHTMXlX2MFngXNgI1+SVPlgV1qdSwmAZnH/4+j3AHNxBmy/Ux6mZAcV3UU4jUC4
         VQPTFuiEo7rIrdIsZjKLli5TTgxvTtDL6VirIT2RsDkKYBB6dsN2QbSyPEu/4bnbjhx3
         I7fJ6vCrk3zVi+OUeF03uUowk3lFdU+ll5iN+HosI+fAzzS/llMhIBImLijyQBrr6yFf
         TfrR+GZC59kge07+7zb+SrwLMQLpwxcvAZ+z4zD41IBH63lJdnZx0f2CnpM62ksj3Yll
         eU0dyygAxbxOZdmt6ecuOjUDKZ8mc3RDdi67na1wwaG/zDnkA/Xp67CQbnIFKiA1704x
         KGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750890428; x=1751495228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAq5XqUsWKP02wGqBYM6J6LlRfdkCsvvuKjaBBLj1lY=;
        b=wklR9mjnlAyxdiLNNFwL6d+GySeqqMfz0Ca6hD+/x1lsZDjjH6vUTomKe0ntsb6g8a
         mu+gAJjkxPPqzXH/u6RgvIyNvGnPdZt7/yWitfJq/ZJJwTe6GPxrs5n3oOukl6IKY8WK
         F7a7vn2y6nvVfE2edgfSMFld7KcQqp7EMxEXZfmNuB6pNyP1cCAOgHEDO7dmE4V1APPq
         0xCe3Ed5nnUGSVZUFa8e5UG2mwHB7heDGJRmyaQY1tQBwvXG7ciPTLbDN4keHe8vz+Df
         njwEvgt4RzH7Kh+6wpLIkOvbfxtht7EeKF/D96yo03MQiDim9K8dWDuM9hK9tojouc5t
         A/eA==
X-Forwarded-Encrypted: i=1; AJvYcCVsEX3S24tG1OxihyHOnxQ3s01oltnsurhtCV8R0bbUvJPKbZfg+oxsQaPjC7gutbAyTtS0gvfm0nUiLsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp7wMZBZ3TVqidmNkbSGpLUxAFVeVkn48eyvgi9YaW1Eo+OOe4
	fJNr2hYiUJwN0Ne1iXImCxn6ZZ7dFdHS4JTj7hUgj/ersfpR5ds7y50Pb9t1ZTc9ni5RMJUI//7
	GNLDtcA==
X-Google-Smtp-Source: AGHT+IEa0LkgFKcL8sEPMtIemA3Ri5mNboFwmG0gnQyI/dNtc6popjMDMK9/SnJHlAcJLEXmS6VTsJsNduI=
X-Received: from pfbho11.prod.google.com ([2002:a05:6a00:880b:b0:747:aac7:7c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:729f:b0:1f5:8de8:3b1a
 with SMTP id adf61e73a8af0-2207f19c614mr7678920637.13.1750890428199; Wed, 25
 Jun 2025 15:27:08 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:25:39 -0700
In-Reply-To: <20250611075842.20959-1-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611075842.20959-1-dapeng1.mi@linux.intel.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <175088941294.719342.11558920055184165961.b4-ty@google.com>
Subject: Re: [kvm-unit-tests PATCH] x86/pmu: Verify all available GP counters
 in check_counters_many()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Zide Chen <zide.chen@intel.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@intel.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 11 Jun 2025 07:58:42 +0000, Dapeng Mi wrote:
> The intent of check_counters_many() is to verify all available counters
> can count correctly at the same time. So an alternative event should be
> picked to verify the avaialbe GP counter instead of skiping the counter
> if the initial event is not available.

Applied to kvm-x86 next, thanks!

[1/1] x86/pmu: Verify all available GP counters in check_counters_many()
      https://github.com/kvm-x86/kvm-unit-tests/commit/525bdb5d65d5

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2077522ACF1;
	Tue,  8 Apr 2025 18:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744136385; cv=none; b=t8qrxnYu6pE4EfeKaZky0bWG2AIPA3/kL/6PA5bRZtJDq/7xEpWC6gJzlVc3jlyFxb7NhBsMg0CXMPRhvzRc3fXQJvXicxqW3V+uWB7yM2aFOCsJjzUZQKVLwEZlg53OTcQhxLWKxXxeAWZByBIqeTgilsimQyaQ6YiDyjgp6b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744136385; c=relaxed/simple;
	bh=BT04Q3wx5T7KJY9SpsyQpGR+AaGDiZCFQmKIG2PNw30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vGLuePBgd1V7nghrBtZs4nginNG14/17J1+8SoZZ5K5kueKIzPKYhQHuykvO3oMEp24/DZa8kcxub8hC6OfedE3eaFSpCg/NNamaHOvJv6jLtpzwbiTkDJTYkds+wwUFh/XVshcKP9xAvM3MXJAO5RlE503OpisTHbGi3w63b9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRyomLqp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRyomLqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3F6C4CEE5;
	Tue,  8 Apr 2025 18:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744136384;
	bh=BT04Q3wx5T7KJY9SpsyQpGR+AaGDiZCFQmKIG2PNw30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GRyomLqpYeC4cWWY48sDagpvvFWbMsJDe3XyiEHnk1OjF+/POjGtI9CfUEmuUNtXq
	 No/GIjxAA9sl10WtBsFDABF8VXKm5ED7RJBHpfUUWv2HW4qoQC3cowfKPen8ntschG
	 PD/W0K1bLtu3E/AQdKT1RVGu6RQ6W41XLOA+FglL0qw//WD5c2GjIGzB7NjTAOpAlZ
	 xjmT3kNEgSg5pv9CsyGrlmgluZYDO6Eq5G1VFQiWIkpY1fHg3MHVLv/9GFQAdEuX/D
	 4xRni1dvojKF/zdBfWsEL0R4GEIlseeP+IN+KA7pXds5kaphe+2xXWZISQEomFRkEX
	 L4CRyBWTIBlJw==
Message-ID: <a8bed98e-0393-4b0a-8b5b-3007015a9af6@kernel.org>
Date: Tue, 8 Apr 2025 13:19:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/CPU/AMD: Print the reason for the last reset
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250408174726.3999817-1-superm1@kernel.org>
 <20250408174726.3999817-2-superm1@kernel.org>
 <20250408181451.GFZ_Vnm6JXaItfwVpK@fat_crate.local>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250408181451.GFZ_Vnm6JXaItfwVpK@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/2025 1:14 PM, Borislav Petkov wrote:
> On Tue, Apr 08, 2025 at 12:47:26PM -0500, Mario Limonciello wrote:
>> diff --git a/Documentation/admin-guide/amd/amd-reboot-reason.csv b/Documentation/admin-guide/amd/amd-reboot-reason.csv
>> new file mode 100644
>> index 0000000000000..c31c7a0464c38
>> --- /dev/null
>> +++ b/Documentation/admin-guide/amd/amd-reboot-reason.csv
>> @@ -0,0 +1,21 @@
>> +Bit, Type, Reason
>> +0, Pin, Thermal trip (BP_THERMTRIP_L)
>> +1, Pin, Power button
>> +2, Pin, SHUTDOWN# pin
>> +4, Remote, Remote ASF power off command
>> +9, Internal, Thermal trip (internal)
>> +16, Pin, User reset (BP_SYS_RST_L)
>> +17, Software, PCI reset (PMIO 0xC4)
>> +18, Software, CF9 reset (0x04)
>> +19, Software, CF9 reset (0x06)
>> +20, Software, CF9 reset (0x0E)
>> +21, Sleep, Power state or ACPI state transition
>> +22, Pin, Keyboard reset (KB_RST_L)
>> +23, Internal, Internal CPU shutdown
>> +24, Hardware, Failed boot timer
>> +25, Hardware, Watchdog timer
>> +26, Remote, Remote ASF reset command
>> +27, Internal, Data fabric sync flood event due to uncorrected error
>> +29, Internal, MP1 Watchdog timer timeout
>> +30, Internal, Parity error
>> +31, Internal, SW sync flood event
>> \ No newline at end of file
> 
> Do we need that table now?

I think it's still valuable to have it in documentation for anyone who 
wants to read more about this.  As we get issues that come out of the 
woodwork I could see people punching the string into a search engine and 
then being spit at debugging.rst and we can adjust documentation to tell 
them what to do with it when it's not clear.

> 
> If so, why not integrate it into debugging.rst?
> 

That's what this does:

+.. csv-table::
+   :header-rows: 1
+   :widths: 1, 1, 1
+   :file: ./amd-reboot-reason.csv

Or do you mean directly in the RST itself?  The RST documentation [1] 
said and I quote: "Choose whatever sucks least."

Link: 
https://pandemic-overview.readthedocs.io/en/latest/myGuides/reStructuredText-Tables-Examples.html 
[1]

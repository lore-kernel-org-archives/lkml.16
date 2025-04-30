Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36672DC791
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018935; cv=none; b=PKxIab3/lUtVG/YSnOoYSGFUXahlPAWR+XAWnPcL7Ntrs3TwM2kILK5qOsxI8d4AfluLKJDiTUrrnSyrpYfNqtZXVq7fOOyECHulyrEX1pne5OPbYkvEzFgUrWCirl069mXPElUjDZhLqF0dnD2tC5nCldcXf/xqv6/A4KfJGHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018935; c=relaxed/simple;
	bh=EPWddZZeioNjTQ5Ffl6LTJ8Xs2kRN8UbXBOyzb+sLvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n+GDWEUsdqr63cqSeKsfCy+p4HogNy1eySUK7KgDvpM2grttCm/LAZtkzqIJNmxdJepcS1ek5qviXY+Z/oI0adbHuPiwES5moSBdlfOp+m0Zjzqz4Ypd/+9k9joqdjPppDw7cN0k8QTqnGBwby8OiBYfYT+Xahj7AQCHqjk0r78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxIK9qIhJoHDnLAA--.6168S3;
	Wed, 30 Apr 2025 21:15:22 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCx_cZmIhJoqoKgAA--.14402S2;
	Wed, 30 Apr 2025 21:15:19 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Enable some configs in loongson3_defconfig
Date: Wed, 30 Apr 2025 21:15:11 +0800
Message-ID: <20250430131516.24287-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx_cZmIhJoqoKgAA--.14402S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAFWxurWfXr4rKryUJrW7WrX_yoW5XF4UpF
	sI9a13trWrJrsagayDZ3ykWa40qrsxC34DJr4UtrWUZr4Dtryqq3WxtaySyay7X3s3Kr1F
	qry8G3yUCFsrXagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

This is a small patchset based on 6.15-rc4, each patch is a
single logical change to better describe the problem and make
it easier to review.

If the changes make sense, all of them can be squashed into one
single patch, I think that would be fine as well, let us see if
other people have concern about it.

By the way, I received many compile-time error reports about tools,
most are related with configs, this is the motivation of this series.

Additionally, I also received one run-time bug report about uprobe,
but it works fine on my test environment. If somebody can reproduce
it, please let me know, maybe I am missing something.

1. How to reproduce

(1) Compile and install Tongsuo

git clone https://github.com/Tongsuo-Project/Tongsuo.git
cd Tongsuo && ./config --prefix=/opt/tongsuo -Wl,-rpath,/opt/tongsuo/lib
make && sudo make install

https://www.tongsuo.net/docs/compilation/source-compilation

(2) Compile and update kernel

Apply this series based on 6.15-rc4, then use the loongson3_defconfig,
CONFIG_UPROBE_EVENTS is already set.

(3) Probe "openssl speed sm2"

cd tools/perf && make
sudo ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery /opt/tongsuo/bin/openssl speed sm2

2. My test results

fedora@linux:~/uprobe.git/tools/perf$ sudo ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
Added new event:
  probe_libcrypto:BN_mod_mul_montgomery (on BN_mod_mul_montgomery in /usr/lib64/libcrypto.so.3.2.2)

You can now use it in all perf tools, such as:

	perf record -e probe_libcrypto:BN_mod_mul_montgomery -aR sleep 1

fedora@linux:~/uprobe.git/tools/perf$ sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery /opt/tongsuo/bin/openssl speed sm2
Doing 256 bits sign CurveSM2's for 10s: 7463 256 bits CurveSM2 signs in 10.00s 
Doing 256 bits verify CurveSM2's for 10s: 9681 256 bits CurveSM2 verify in 9.98s
...
                              sign    verify    sign/s verify/s
 256 bits SM2 (CurveSM2)   0.0013s   0.0010s    746.3    970.0

 Performance counter stats for '/opt/tongsuo/bin/openssl speed sm2':

                 0      probe_libcrypto:BN_mod_mul_montgomery                                      

      20.007539877 seconds time elapsed

      19.990010000 seconds user
       0.000000000 seconds sys

Thanks,
Tiezhu

Tiezhu Yang (5):
  LoongArch: Clean up loongson3_defconfig
  LoongArch: Enable tracing infrastructure in defconfig
  LoongArch: Enable tracing syscalls in defconfig
  LoongArch: Enable debug information in defconfig
  LoongArch: Enable kprobe and ftrace in defconfig

 arch/loongarch/configs/loongson3_defconfig | 74 +++++-----------------
 1 file changed, 16 insertions(+), 58 deletions(-)

-- 
2.42.0

